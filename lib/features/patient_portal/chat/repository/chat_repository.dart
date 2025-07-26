import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';

abstract class ChatRepository {
  Future<Either<ApiFailure, dynamic>> getChat(Map<String, dynamic> params);
}
