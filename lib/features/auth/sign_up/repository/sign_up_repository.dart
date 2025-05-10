import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';

import '../../sign_in/models/login_response.dart';

abstract class SignUpRepository {
  Future<Either<ApiFailure, LoginResponse>> signUp(Map<String, dynamic> params);

  Future<Either<ApiFailure, dynamic>> checkUserExit(
      Map<String, dynamic> params);
}
