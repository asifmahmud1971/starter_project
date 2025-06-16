import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/city_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/current_package_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/home_visit_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/thana_response.dart';
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
      fromJson: HomeVisitModel.fromJson,
    );
  }

  @override
  Future<Either<ApiFailure, ProcedureModel>> getProcedure(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.procedure,
      method: Method.get,
      params: params,
      fromJson: ProcedureModel.fromJson,
    );
  }

  @override
  Future<Either<ApiFailure, CurrentPackageResponse>> getPatientPackage(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.inPatientPackage,
      method: Method.get,
      params: params,
      fromJson: CurrentPackageResponse.fromJson,
    );
  }

  @override
  Future<Either<ApiFailure, CityResponse>> getCity(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.city,
      method: Method.get,
      params: params,
      fromJson: CityResponse.fromJson,
    );
  }

  @override
  Future<Either<ApiFailure, ThanaResponse>> getThana(
      Map<String, dynamic> params,int? id) {
    return apiRequest.performRequest(
      url: "${ApiUrls.thana}/$id",
      method: Method.get,
      params: params,
      fromJson: ThanaResponse.fromJson,
    );
  }

  @override
  Future<Either<ApiFailure, dynamic>> inPatientPackage(
      Map<String, dynamic> params) async {
    return apiRequest.performRequest(
      url: ApiUrls.inPatientPackage,
      method: Method.post,
      params: params,
    );
  }
}
