part of 'painClinic_cubit.dart';

class PainClinicState extends Equatable {
  final AppStatus appStatus;
  final PainAssessmentModel? painAssessmentModel;
  final MedicationModel? medicationModel;


  const PainClinicState( {
    this.painAssessmentModel,
    this.medicationModel,
    this.appStatus = AppStatus.initial,
  });

  PainClinicState copyWith({
    final AppStatus? appStatus,
    final PainAssessmentModel? painAssessmentModel,
    final FollowUpModel? followUp,
    final MedicationModel? medicationModel
  }) {
    return PainClinicState(
      appStatus: appStatus ?? this.appStatus,
      painAssessmentModel: painAssessmentModel ?? this.painAssessmentModel,
      medicationModel: medicationModel ?? this.medicationModel,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, painAssessmentModel ?? {},medicationModel??{}];
}
