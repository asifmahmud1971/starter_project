import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';

abstract class ForgotPasswordRepositoryImp {
  Future<Either<ApiFailure, dynamic>> forgotPassword(
    Map<String, dynamic> params,
  );

  Future<Either<ApiFailure, dynamic>> setPassword(
    Map<String, dynamic> params,
  );
}
