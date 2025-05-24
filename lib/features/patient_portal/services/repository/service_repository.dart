import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';

abstract class ServiceRepository {
  Future<Either<ApiFailure, PrescriptionModel>> getPrescription(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, FollowUpModel>> getFollowUp(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, FollowUpModel>> createFollowUp(
      Map<String, dynamic> params);


}
