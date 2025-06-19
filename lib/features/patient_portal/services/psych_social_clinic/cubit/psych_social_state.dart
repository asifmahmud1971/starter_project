part of 'psych_social_cubit.dart';

class PsychSocialState extends Equatable {
  final AppStatus appStatus;
  final PsychoSocialReportResponse? psychoSocialReportResponse;
  final PsychoSocialResponse? psychoSocialResponse;

  const PsychSocialState(
      {this.appStatus = AppStatus.initial,
      this.psychoSocialReportResponse,
      this.psychoSocialResponse});

  PsychSocialState copyWith({
    final AppStatus? appStatus,
    final PsychoSocialReportResponse? psychoSocialReportResponse,
    final PsychoSocialResponse? psychoSocialResponse,
  }) {
    return PsychSocialState(
      appStatus: appStatus ?? this.appStatus,
      psychoSocialReportResponse:
          psychoSocialReportResponse ?? this.psychoSocialReportResponse,
      psychoSocialResponse: psychoSocialResponse ?? this.psychoSocialResponse,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        psychoSocialReportResponse ?? {},
        psychoSocialResponse ?? {},
      ];
}
