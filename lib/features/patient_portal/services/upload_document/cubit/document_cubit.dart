import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/model/document_model.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/model/upload_data_model.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_describe_report.dart';

import '../../../../../core/app/app_context.dart';

part 'document_state.dart';

@injectable
class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit(this.serviceRepository) : super(const DocumentState());

  final ServiceRepository serviceRepository;

  TextEditingController titleController = TextEditingController();

  String? location;
  String? _test;
  String? changeOfTime;
  String? radiation;
  String? relievingFactors;
  String? severity;
  String? causeOfPain;

  Future<void> getDocument() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await serviceRepository.getAllDocument({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, documentModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> uploadDocument({String? imagePath}) async {
    showProgressDialog();
    emit(state.copyWith(
        appStatus: AppStatus.loading,
        uploadProgress: 0.0,
        uploadProgressString: '0.0%'));

    try {
      final imageFile = await MultipartFile.fromFile(
        imagePath ?? "",
        filename: imagePath?.split('/').last,
      );

      final response = await serviceRepository.uploadDocument(
        {
          "image": imageFile,
          "title": titleController.text,
        },
        // Your parameters map
        (int sentBytes, int totalBytes) {
          final progress = sentBytes / totalBytes;
          emit(state.copyWith(
              appStatus: AppStatus.loading,
              uploadProgress: progress,
              uploadProgressString: '${(progress * 100).toStringAsFixed(1)}%'));
        },
        (int receivedBytes, int totalBytes) {
          final progress = receivedBytes / totalBytes;
          emit(state.copyWith(
              appStatus: AppStatus.loading,
              uploadProgress: progress,
              uploadProgressString: '${(progress * 100).toStringAsFixed(1)}%'));
        },
      );

      response.fold(
        (failure) {
          emit(state.copyWith(
            appStatus: AppStatus.failure,
            errorMessage:
                failure.message, // Assuming ApiFailure has a message field
          ));
        },
        (data) async {
          /*    state.allWoundData?.woundAssessment
              ?.insert(0, data.savedData ?? WoundData());

          emit(state.copyWith(
            appStatus: AppStatus.success,
            woundDocumentData: data,
            allWoundData: state.allWoundData,
            uploadProgress: 100.0, // Mark as fully completed
          ));*/
          GetContext.back();
        },
      );
    } catch (e) {
      emit(state.copyWith(
        appStatus: AppStatus.failure,
        errorMessage: e.toString(),
      ));
    } finally {
      dismissProgressDialog();
    }
  }

  void resetScreen() {
    location = null;
    changeOfTime = null;
    radiation = null;
    relievingFactors = null;
    severity = null;
    causeOfPain = null;
  }
}
