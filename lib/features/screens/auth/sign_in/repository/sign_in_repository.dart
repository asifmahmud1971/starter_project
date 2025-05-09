import 'package:dartz/dartz.dart';
import 'package:demo/data/network/api_failure.dart';
import 'package:demo/features/screens/auth/sign_in/models/login_response.dart';

abstract class SignInRepository {
  Future<Either<ApiFailure, LoginResponse>> signIn(Map<String, dynamic> params);
}
