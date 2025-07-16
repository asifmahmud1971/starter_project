import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/ambulance_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/assign_shift_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/city_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/consultants_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/current_package_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/on_sarevice_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/thana_response.dart';
abstract class OnDemandServiceRepository {
  Future<Either<ApiFailure, OnServiceModel>> getHomeVisit(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, OnServiceModel>> getProcedure(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, OnServiceModel>> getAlliedHealth(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, OnServiceModel>> getPharmacy(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, OnServiceModel>> getLab(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, OnServiceModel>> getInstrument(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, OnServiceModel>> getInstrumentRate(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, CurrentPackageResponse>> getPatientPackage(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, CityResponse>> getCity(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, ThanaResponse>> getThana(
      Map<String, dynamic> params,int? id);
  Future<Either<ApiFailure, dynamic>> inPatientPackage(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, ConsultantsResponse>> getConsultants(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, AssignShiftModel>> getAssignStaff(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, AmbulanceResponse>> getAmbulance(
      Map<String, dynamic> params);

}
