import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/add_pain_assessment_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/model/document_model.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/all_wound_data.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_describe_report.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_document_data.dart';
import 'service_repository.dart';

@Injectable(as: ServiceRepository)
class ServiceRepositoryImp implements ServiceRepository {
  ServiceRepositoryImp({required this.apiRequest});

  final ApiRequest apiRequest;


  @override
  Future<Either<ApiFailure, PrescriptionModel>> getPrescription(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.prescription,
        method: Method.get,
        params: params,
        fromJson: PrescriptionModel.fromJson);
  }
@override
  Future<Either<ApiFailure, FollowUpModel>> getFollowUp(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.followUp,
        method: Method.get,
        params: params,
        fromJson: FollowUpModel.fromJson);
  }
@override
  Future<Either<ApiFailure, PainAssessmentModel>> getPainAssessment(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.painAssessment,
        method: Method.get,
        params: params,
        fromJson: PainAssessmentModel.fromJson);
  }

  @override
  Future<Either<ApiFailure, AddPainAssessmentModel>> addPainAssessment(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.addPainAssessment,
        method: Method.post,
        params: params,
        fromJson: AddPainAssessmentModel.fromJson);
  }


@override
  Future<Either<ApiFailure, MedicationModel>> getMedication(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.painMedication,
        method: Method.get,
        params: params,
        fromJson: MedicationModel.fromJson);
  }
@override
  Future<Either<ApiFailure, dynamic>> givenMedicine(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.givenMedicine,
        method: Method.post,
        params: params);
  }

@override
  Future<Either<ApiFailure, Followup>> createFollowUp(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.followUp,
        method: Method.post,
        params: params,
        fromJson: Followup.fromJson);
  }
@override
  Future<Either<ApiFailure, WoundDescribeReportModel>> getWoundDescribeReport(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.woundDescribeReport,
        method: Method.get,
        params: params,
        fromJson: WoundDescribeReportModel.fromJson);
  }
  @override
  Future<Either<ApiFailure, DocumentModel>> getAllDocument(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.showUploadDocument,
        method: Method.get,
        params: params,
        fromJson: DocumentModel.fromJson);
  }
@override
  Future<Either<ApiFailure, DocumentModel>> documentUpload(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.showUploadDocument,
        method: Method.get,
        params: params,
        fromJson: DocumentModel.fromJson);
  }
@override
  Future<Either<ApiFailure, WoundDocumentData>> woundDocumentUpload(
      Map<String, dynamic> params,ProgressCallback? onSendProgress, // Added callback for upload progress
    ProgressCallback? onReceiveProgress,) {
    return apiRequest.performRequest(
        url: ApiUrls.uploadWoundImage,
        method: Method.post,
        params: params,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onReceiveProgress,
        isMultipart: true,
        fromJson: WoundDocumentData.fromJson);
  }
@override
  Future<Either<ApiFailure, AllWoundData>> showAllWoundAssessment(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.showAllWoundAssessment,
        method: Method.get,
        params: params,
        fromJson: AllWoundData.fromJson);
  }

}
