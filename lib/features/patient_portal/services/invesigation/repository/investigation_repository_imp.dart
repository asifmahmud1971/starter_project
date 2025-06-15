import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';

import '../model/investigation_response.dart';

abstract class InvestigationRepositoryImp {

  Future<Either<ApiFailure, InvestigationsResponse>> getInvestigationData(
    Map<String, dynamic> params,
  );

}
