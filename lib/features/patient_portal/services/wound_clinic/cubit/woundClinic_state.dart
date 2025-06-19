part of 'woundClinic_cubit.dart';

class WoundClinicState extends Equatable {
  final AppStatus appStatus;
  final PainAssessmentModel? painAssessmentModel;
  final MedicationModel? medicationModel;
  final WoundDescribeReportModel? woundDescribeReportModel;
  final WoundDocumentData? woundDocumentData;
  final AllWoundData? allWoundData;
  final double? uploadProgress;
  final String? uploadProgressString;
  final String? errorMessage;


  const WoundClinicState(  {
    this.painAssessmentModel,
    this.medicationModel,
    this.appStatus = AppStatus.initial,
    this.woundDescribeReportModel,
    this.uploadProgress,
    this.errorMessage,
    this.woundDocumentData,
    this.uploadProgressString,
    this.allWoundData,
  });

  WoundClinicState copyWith({
    final AppStatus? appStatus,
    final PainAssessmentModel? painAssessmentModel,
    final FollowUpModel? followUp,
    final MedicationModel? medicationModel,
    final WoundDescribeReportModel? woundDescribeReportModel,
    final double? uploadProgress,
    final String? errorMessage,
    final WoundDocumentData? woundDocumentData,
    final String? uploadProgressString,
    final AllWoundData? allWoundData
  }) {
    return WoundClinicState(
      appStatus: appStatus ?? this.appStatus,
      painAssessmentModel: painAssessmentModel ?? this.painAssessmentModel,
      medicationModel: medicationModel ?? this.medicationModel,
      woundDescribeReportModel: woundDescribeReportModel ?? this.woundDescribeReportModel,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      errorMessage: errorMessage ?? this.errorMessage,
      woundDocumentData: woundDocumentData ?? this.woundDocumentData,
      uploadProgressString: uploadProgressString ?? this.uploadProgressString,
      allWoundData: allWoundData ?? this.allWoundData,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, painAssessmentModel ?? {},medicationModel??{},woundDescribeReportModel??{},uploadProgress??0.0,errorMessage??"",woundDocumentData??{},uploadProgressString??"0.0%",allWoundData??{}];
}
