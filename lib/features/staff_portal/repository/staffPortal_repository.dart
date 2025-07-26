import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/staff_portal/attendence/model/attendance_model.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicineAlertGiven.dart';
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';
import 'package:medPilot/features/staff_portal/pescription/model/patient_list.dart';
import 'package:medPilot/features/staff_portal/pescription/model/staff_pescription.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';
import 'package:medPilot/features/staff_portal/task/model/task_data.dart';
import 'package:medPilot/features/staff_portal/task/model/task_model.dart';

abstract class StaffPortalRepository {
  Future<Either<ApiFailure, RosterModel>> getRosterData(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, MedicineAlertModel>> getMedicineAlertData(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, StaffPrescription>> getStaffPrescription(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, TaskModel>> getTask(Map<String, dynamic> params);

  Future<Either<ApiFailure, PatientList>> getPatient(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, AttendanceModel>> getAttendanceData(
      Map<String, dynamic> params);

  Future<Either<ApiFailure, TaskData>> taskStatusUpdate(String? type, int? id);

  Future<Either<ApiFailure, MedicineAlertGiven>> markAsMedicineGiven(int? id);

  Future<Either<ApiFailure, MedicineAlertGiven>> markAsMedicineNotGiven(
      int? id);
}
