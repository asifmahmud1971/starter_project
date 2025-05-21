import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/auth/sign_in/models/login_response.dart';

abstract class ProfileRepositoryImp {
  Future<Either<ApiFailure, LoginResponse>> login(
    Map<String, dynamic> params,
  );
}
