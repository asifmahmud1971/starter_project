import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/city_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/current_package_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/home_visit_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/thana_response.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';
abstract class StaffPortalRepository {
  Future<Either<ApiFailure, RosterModel>> getRosterData(
      Map<String, dynamic> params);

}
