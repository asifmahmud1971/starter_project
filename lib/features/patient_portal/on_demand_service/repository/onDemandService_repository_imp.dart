import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/home_visit_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/add_pain_assessment_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/model/document_model.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_describe_report.dart';
import 'onDemandService_repository.dart';

@Injectable(as: OnDemandServiceRepository)
class OnDemandServiceRepositoryImp implements OnDemandServiceRepository {
  OnDemandServiceRepositoryImp({required this.apiRequest});

  final ApiRequest apiRequest;


  @override
  Future<Either<ApiFailure, HomeVisitModel>> getHomeVisit(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.homeVisit,
        method: Method.get,
        params: params,
        fromJson: HomeVisitModel.fromJson);
  }
   @override
  Future<Either<ApiFailure, ProcedureModel>> getProcedure(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.procedure,
        method: Method.get,
        params: params,
        fromJson: ProcedureModel.fromJson);
  }

}
