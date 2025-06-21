import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/model/all_psych_social_response.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/model/psycho_social_response.dart';
import 'package:medPilot/features/profile/models/user_profile_response.dart';
import '../../../../../data/network/api_client.dart';
import '../../../../../data/network/api_exception.dart';
import '../../../../../data/network/api_failure.dart';
import '../../../../../data/network/api_urls.dart';
import 'psych_social_repository_imp.dart';

@Injectable(as: PsychSocialRepositoryImp)
class PsychSocialRepository implements PsychSocialRepositoryImp {
  PsychSocialRepository({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<Either<ApiFailure, PsychoSocialReportResponse>> getPsychoSocial(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
          url: ApiUrls.reportPsychoSocial, method: Method.get, params: params);

      return Right(PsychoSocialReportResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

  @override
  Future<Either<ApiFailure, PsychoSocialResponse>> addPsychoSocial(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
          url: ApiUrls.addPsychoSocial, method: Method.post, params: params);

      return Right(PsychoSocialResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

}
