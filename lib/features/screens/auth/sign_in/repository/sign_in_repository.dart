import 'package:demo/data/network/api_failure.dart';
import 'package:demo/features/screens/auth/sign_in/models/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class SignInRepository {
  Future<Either<ApiFailure, LoginResponse>> signIn(Map<String, dynamic> params);
}
