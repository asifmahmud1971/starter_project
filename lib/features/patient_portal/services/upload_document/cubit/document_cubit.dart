import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/model/document_model.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_describe_report.dart';

part 'document_state.dart';

@injectable
class DocumentCubit extends Cubit<DocumentState> {
  DocumentCubit(this.serviceRepository) : super(const DocumentState());

  final ServiceRepository serviceRepository;

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

  void resetScreen(){
    location = null;
    changeOfTime = null;
    radiation = null;
    relievingFactors = null;
    severity = null;
    causeOfPain = null;
  }


}
