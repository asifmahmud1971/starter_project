import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/city_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/current_package_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/home_visit_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/thana_response.dart';
abstract class OnDemandServiceRepository {
  Future<Either<ApiFailure, HomeVisitModel>> getHomeVisit(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, ProcedureModel>> getProcedure(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, CurrentPackageResponse>> getPatientPackage(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, CityResponse>> getCity(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, ThanaResponse>> getThana(
      Map<String, dynamic> params,int? id);
  Future<Either<ApiFailure, dynamic>> inPatientPackage(
      Map<String, dynamic> params);

}
