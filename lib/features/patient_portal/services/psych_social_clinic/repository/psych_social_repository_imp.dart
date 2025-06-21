import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/model/all_psych_social_response.dart';
import 'package:medPilot/features/patient_portal/services/psych_social_clinic/model/psycho_social_response.dart';

abstract class PsychSocialRepositoryImp {

  Future<Either<ApiFailure, PsychoSocialReportResponse>> getPsychoSocial(
    Map<String, dynamic> params,
  );
  Future<Either<ApiFailure, PsychoSocialResponse>> addPsychoSocial(
      Map<String, dynamic> params,
      );

}
