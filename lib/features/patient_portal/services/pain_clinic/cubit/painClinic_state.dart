part of 'painClinic_cubit.dart';

class PainClinicState extends Equatable {
  final AppStatus appStatus;
  final PainAssessmentModel? painAssessmentModel;


  const PainClinicState( {
    this.painAssessmentModel,
    this.appStatus = AppStatus.initial,
  });

  PainClinicState copyWith({
    final AppStatus? appStatus,
    final PainAssessmentModel? painAssessmentModel,
    final FollowUpModel? followUp
  }) {
    return PainClinicState(
      appStatus: appStatus ?? this.appStatus,
      painAssessmentModel: painAssessmentModel ?? this.painAssessmentModel,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, painAssessmentModel ?? {}];
}
