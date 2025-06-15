import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/home_visit_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/procedure_model.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/model/follow_up.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/add_pain_assessment_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/medication_model.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/model/pain_assessment.dart';
import 'package:medPilot/features/patient_portal/services/upload_document/model/document_model.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/model/wound_describe_report.dart';


abstract class OnDemandServiceRepository {
  Future<Either<ApiFailure, HomeVisitModel>> getHomeVisit(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, ProcedureModel>> getProcedure(
      Map<String, dynamic> params);

}
