import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/features/profile/models/user_profile_response.dart';
import '../../../../../data/network/api_client.dart';
import '../../../../../data/network/api_exception.dart';
import '../../../../../data/network/api_failure.dart';
import '../../../../../data/network/api_urls.dart';
import '../../auth/sign_in/models/login_response.dart';
import 'profile_repository_imp.dart';

@Injectable(as: ProfileRepositoryImp)
class ProfileRepository implements ProfileRepositoryImp {
  ProfileRepository({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<Either<ApiFailure, LoginResponse>> login(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
          url: ApiUrls.login, method: Method.post, params: params);

      return Right(LoginResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
  @override
  Future<Either<ApiFailure, UserProfileResponse>> getUserData(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
          url: ApiUrls.profile, method: Method.get, params: params);

      return Right(UserProfileResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
