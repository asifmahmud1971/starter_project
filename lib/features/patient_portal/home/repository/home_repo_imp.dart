import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/features/patient_portal/home/repository/home_repo.dart';

@injectable
class HomeRepositoryImp implements HomeRepository {
  HomeRepositoryImp({required this.apiRequest});

  ApiRequest apiRequest;

  @override
  Future<Either<ApiFailure, dynamic>> addAudioFavorite(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: "audios/${params['id']}/favorite",
        method: Method.post,
        params: params);
  }
}
