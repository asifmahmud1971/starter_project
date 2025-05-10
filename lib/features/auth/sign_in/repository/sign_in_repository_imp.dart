import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/network/api_client.dart';
import '../../../../../data/network/api_failure.dart';
import '../../../../../data/network/api_request.dart';
import '../../../../../data/network/api_urls.dart';
import '../models/login_response.dart';
import 'sign_in_repository.dart';

@Injectable(as: SignInRepository)
class SignInRepositoryImp implements SignInRepository {
  SignInRepositoryImp({required this.apiRequest});

  final ApiRequest apiRequest;

  @override
  Future<Either<ApiFailure, LoginResponse>> signIn(
    Map<String, dynamic> params,
  ) {
    return apiRequest.performRequest(
      url: ApiUrls.login,
      method: Method.post,
      params: params,
      fromJson: LoginResponse.fromMap,
    );
  }
}
