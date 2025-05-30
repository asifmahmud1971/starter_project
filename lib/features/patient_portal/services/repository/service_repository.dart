import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/add_pain_assessment_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/model/document_model.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_describe_report.dart';

import '../pain_clinic/widgets/pain_assessment.dart';

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
  Future<Either<ApiFailure, dynamic>> givenMedicine(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, Followup>> createFollowUp(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, WoundDescribeReportModel>> getWoundDescribeReport(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, DocumentModel>> getAllDocument(
      Map<String, dynamic> params);
Future<Either<ApiFailure, DocumentModel>> documentUpload(
      Map<String, dynamic> params);



}
