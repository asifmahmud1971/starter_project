import 'package:demo/data/network/api_client.dart';
import 'package:demo/data/network/api_failure.dart';
import 'package:demo/data/network/api_request.dart';
import 'package:demo/data/network/api_urls.dart';
import 'package:demo/features/screens/auth/sign_up/repository/sign_up_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../sign_in/models/login_response.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImp implements SignUpRepository {
  SignUpRepositoryImp({required this.apiRequest});

  final ApiRequest apiRequest;

  @override
  Future<Either<ApiFailure, LoginResponse>> signUp(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
      url: ApiUrls.register,
      method: Method.post,
      params: params,
      fromJson: LoginResponse.fromMap,
    );
  }

  @override
  Future<Either<ApiFailure, dynamic>> checkUserExit(
    Map<String, dynamic> params,
  ) {
    return apiRequest.performRequest(
      url: ApiUrls.checkEmailExists,
      method: Method.post,
      params: params,
    );
  }
}
