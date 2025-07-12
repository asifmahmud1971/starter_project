import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/home/model/blog_model.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/model/staff_permission_model.dart';

import 'chat_repository.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImp implements ChatRepository {
  ChatRepositoryImp({required this.apiRequest});

  final ApiRequest apiRequest;


  @override
  Future<Either<ApiFailure, dynamic>> getChat(Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.aiChat,
        method: Method.post,
        params: params);
  }
}
