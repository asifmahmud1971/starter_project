import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/network/api_client.dart';
import '../../../../../data/network/api_exception.dart';
import '../../../../../data/network/api_failure.dart';
import '../../../../../data/network/api_urls.dart';
import '../models/login_response.dart';
import 'sign_in_repository_imp.dart';

@Injectable(as: SignInRepositoryImp)
class SignInRepository implements SignInRepositoryImp {
  SignInRepository({required this.apiClient});

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
}
