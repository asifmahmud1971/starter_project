import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/add_pain_assessment_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';

import '../pain_clinic/widget/pain_assessment.dart';

abstract class ServiceRepository {
  Future<Either<ApiFailure, PrescriptionModel>> getPrescription(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, FollowUpModel>> getFollowUp(
      Map<String, dynamic> params);
Future<Either<ApiFailure, PainAssessmentModel>> getPainAssessment(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, AddPainAssessmentModel>> addPainAssessment(
      Map<String, dynamic> params);
Future<Either<ApiFailure, MedicationModel>> getMedication(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, Followup>> createFollowUp(
      Map<String, dynamic> params);


}
