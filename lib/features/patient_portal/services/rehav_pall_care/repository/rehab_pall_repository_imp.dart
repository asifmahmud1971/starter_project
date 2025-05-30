import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/services/rehav_pall_care/model/rehab_pall_care_response.dart';

import '../model/rehab_pall_video_response.dart';

abstract class RehabPallRepositoryImp {
  Future<Either<ApiFailure, RehabPallCareResponse>> getRehabPall(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, RehabPallVideoResponse>> getRehabPallVideo(
      Map<String, dynamic> params,int id);
}

