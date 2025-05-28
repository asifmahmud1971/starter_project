part of 'woundClinic_cubit.dart';

class WoundClinicState extends Equatable {
  final AppStatus appStatus;
  final PainAssessmentModel? painAssessmentModel;
  final MedicationModel? medicationModel;
  final WoundDescribeReportModel? woundDescribeReportModel;


  const WoundClinicState(  {
    this.painAssessmentModel,
    this.medicationModel,
    this.appStatus = AppStatus.initial,
    this.woundDescribeReportModel,
  });

  WoundClinicState copyWith({
    final AppStatus? appStatus,
    final PainAssessmentModel? painAssessmentModel,
    final FollowUpModel? followUp,
    final MedicationModel? medicationModel,
    final WoundDescribeReportModel? woundDescribeReportModel
  }) {
    return WoundClinicState(
      appStatus: appStatus ?? this.appStatus,
      painAssessmentModel: painAssessmentModel ?? this.painAssessmentModel,
      medicationModel: medicationModel ?? this.medicationModel,
      woundDescribeReportModel: woundDescribeReportModel ?? this.woundDescribeReportModel,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, painAssessmentModel ?? {},medicationModel??{},woundDescribeReportModel??{}];
}
