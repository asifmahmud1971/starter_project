import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/home/model/blog_model.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/model/staff_permission_model.dart';

abstract class ChatRepository {
 Future<Either<ApiFailure, dynamic>> getChat(
      Map<String, dynamic> params);
}
