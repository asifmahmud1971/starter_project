

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/model/rehab_pall_care_response.dart';
import '../model/rehab_pall_video_response.dart';
import 'rehab_pall_repository_imp.dart';

@Injectable(as: RehabPallRepositoryImp)
class RehabPallRepository implements RehabPallRepositoryImp {
  RehabPallRepository({required this.apiRequest});

  final ApiRequest apiRequest;
  @override
  Future<Either<ApiFailure, RehabPallCareResponse>> getRehabPall(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.rehabPullCareReport,
        method: Method.get,
        params: params,
        fromJson: RehabPallCareResponse.fromJson);
  }

  @override
  Future<Either<ApiFailure, RehabPallVideoResponse>> getRehabPallVideo(
      Map<String, dynamic> params,int? id) {
    return apiRequest.performRequest(
        url: "${ApiUrls.rehabilitativePallVideo}/$id",
        method: Method.get,
        params: params,
        fromJson: RehabPallVideoResponse.fromJson);
  }

}
