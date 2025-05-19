import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';

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


}
