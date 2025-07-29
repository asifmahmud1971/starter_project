import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/repository/service_repository.dart';
import '../pescription/model/alarm_setting.dart';
part 'services_state.dart';

@injectable
class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit(this.serviceRepository) : super(const ServiceState());

  final ServiceRepository serviceRepository;
  final List<bool> selectedDays = List.filled(7, false);
  final List<AlarmSetting> alarms = [];
  String alarmType = 'Daily';
  TimeOfDay selectedTime = TimeOfDay.now();
  bool notifyPortal = true;
  bool notifyNurse = true;
  DateTime? startDate;
  DateTime? endDate;
  List<String>? typeOutput;
  List<String>? timeOutput;
  List<String>? dayOutput;


  Future<void> getPrescription() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await serviceRepository.getPrescription({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, prescriptionModel: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }



  Future<void> addMedicineAlert({String? id}) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    int? daysDifference = endDate?.difference(startDate!).inDays;
    dataProcess();

    Map<String, dynamic> params={
      "medicine": id,
      "day_type": typeOutput,
      "duration": daysDifference,
      "time": timeOutput,
      "day": dayOutput,
      "portal": notifyPortal?"1":"0",
      "nurse": notifyNurse?"1":"0"
    };

    try {
      final response = await serviceRepository.addMedicineAlert(params);
      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success));
          resetField();
          GetContext.back();
        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  void dataProcess(){
    List<String>? type =[];
    List<String>? time =[];
    List<String>? day =[];
    for (int i = 0; i < alarms.length; i++) {
      type.add(alarms[i].type.toString());
      time.add(timeFormat(alarms[i].time));
      day.add(alarms[i].days.toString());
    }
    typeOutput = type.map((e) => '"$e"').toList();
    timeOutput = time.map((e) => '"$e"').toList();
    dayOutput = day.map((e) => '"$e"').toList();
  }

  String timeFormat(TimeOfDay time) {
    DateTime dateTime = DateTime(0, 1, 1, time.hour, time.minute);
    String formattedTime = DateFormat('HH:mm').format(dateTime);
    return formattedTime;
  }

  void resetField(){
    typeOutput = [];
    timeOutput = [];
    dayOutput = [];
    alarms.clear();
    alarmType = 'Daily';

  }

}
