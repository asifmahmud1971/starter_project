import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_exception.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'forgot_password_repository_imp.dart';

@Injectable(as: ForgotPasswordRepositoryImp)
class ForgotPasswordRepository implements ForgotPasswordRepositoryImp {
  ForgotPasswordRepository({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<Either<ApiFailure, dynamic>> forgotPassword(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
          url: ApiUrls.login, method: Method.post, params: params);
      return Right(response);
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }
}
