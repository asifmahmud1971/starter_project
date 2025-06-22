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
import 'package:medPilot/features/staff_portal/medicine_alert/model/medicine_alert_model.dart';
import 'package:medPilot/features/staff_portal/pescription/model/staff_pescription.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';
import 'staffPortal_repository.dart';

@Injectable(as: StaffPortalRepository)
class StaffPortalRepositoryImp implements StaffPortalRepository {
  StaffPortalRepositoryImp({required this.apiRequest});

  final ApiRequest apiRequest;

  @override
  Future<Either<ApiFailure, RosterModel>> getRosterData(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.rosterStaff,
      method: Method.get,
      params: params,
      fromJson: RosterModel.fromJson,
    );
  }

  @override
  Future<Either<ApiFailure, MedicineAlertModel>> getMedicineAlertData(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.medicineAlertStaff,
      method: Method.get,
      params: params,
      fromJson: MedicineAlertModel.fromJson,
    );
  }

  @override
  Future<Either<ApiFailure, StaffPrescription>> getStaffPrescription(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.patientPrescription,
      method: Method.post,
      params: params,
      fromJson: StaffPrescription.fromJson,
    );
  }
}
