import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/ambulance_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/assign_shift_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/city_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/consultants_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/current_package_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/on_sarevice_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/thana_response.dart';
import 'onDemandService_repository.dart';

@Injectable(as: OnDemandServiceRepository)
class OnDemandServiceRepositoryImp implements OnDemandServiceRepository {
  OnDemandServiceRepositoryImp({required this.apiRequest});

  final ApiRequest apiRequest;

  @override
  Future<Either<ApiFailure, OnServiceModel>> getHomeVisit(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.homeVisit,
      method: Method.get,
      params: params,
      fromJson: OnServiceModel.fromJson,
    );
  }
  @override
  Future<Either<ApiFailure, OnServiceModel>> getProcedure(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.procedure,
      method: Method.get,
      params: params,
      fromJson: OnServiceModel.fromJson,
    );
  }  @override
  Future<Either<ApiFailure, OnServiceModel>> getAlliedHealth(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.alliedHealth,
      method: Method.get,
      params: params,
      fromJson: OnServiceModel.fromJson,
    );
  }
  Future<Either<ApiFailure, OnServiceModel>> getPharmacy(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.pharmacy,
      method: Method.get,
      params: params,
      fromJson: OnServiceModel.fromJson,
    );
  }
  Future<Either<ApiFailure, OnServiceModel>> getLab(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.lab,
      method: Method.get,
      params: params,
      fromJson: OnServiceModel.fromJson,
    );
  }
  Future<Either<ApiFailure, OnServiceModel>> getInstrument(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.instrument,
      method: Method.get,
      params: params,
      fromJson: OnServiceModel.fromJson,
    );
  }
  @override
  Future<Either<ApiFailure, OnServiceModel>> getInstrumentRate(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.homeVisit,
      method: Method.get,
      params: params,
      fromJson: OnServiceModel.fromJson,
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
  @override
  Future<Either<ApiFailure, ConsultantsResponse>> getConsultants(
      Map<String, dynamic> params) async {
    return apiRequest.performRequest(
      url: ApiUrls.doctorList,
      method: Method.get,
      params: params,
      fromJson: ConsultantsResponse.fromJson,
    );
  }
  @override
  Future<Either<ApiFailure, AssignShiftModel>> getAssignStaff(
      Map<String, dynamic> params) async {
    return apiRequest.performRequest(
      url: ApiUrls.userRoster,
      method: Method.get,
      params: params,
      fromJson: AssignShiftModel.fromJson,
    );
  }
  @override
  Future<Either<ApiFailure, AmbulanceResponse>> getAmbulance(
      Map<String, dynamic> params) async {
    return apiRequest.performRequest(
      url: ApiUrls.showAllAmbulanceRequest,
      method: Method.get,
      params: params,
      fromJson: AmbulanceResponse.fromJson,
    );
  }
}
