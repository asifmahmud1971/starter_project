import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/features/patient_portal/services/invesigation/model/investigation_response.dart';
import '../../../../../data/network/api_client.dart';
import '../../../../../data/network/api_exception.dart';
import '../../../../../data/network/api_failure.dart';
import '../../../../../data/network/api_urls.dart';
import 'investigation_repository_imp.dart';

@Injectable(as: InvestigationRepositoryImp)
class InvestigationRepository implements InvestigationRepositoryImp {
  InvestigationRepository({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<Either<ApiFailure, InvestigationsResponse>> getInvestigationData(
      Map<String, dynamic> params) async {
    try {
      final response = await apiClient.request(
          url: ApiUrls.investigation, method: Method.get, params: params);

      return Right(InvestigationsResponse.fromJson(response));
    } catch (error) {
      return Left(ApiException.handle(error).failure);
    }
  }

}
