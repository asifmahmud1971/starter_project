import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/model/staff_permission_model.dart';

abstract class HomeRepository {
  Future<Either<ApiFailure, DashboardPermission>> getDashboardPermission(
      Map<String, dynamic> params);
Future<Either<ApiFailure, StaffPermissionModel>> getStaffPermission(
      Map<String, dynamic> params);

   Future<Either<ApiFailure, PrescriptionModel>> getPrescription(
      Map<String, dynamic> params);


}
