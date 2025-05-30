part of 'document_cubit.dart';

class DocumentState extends Equatable {
  final AppStatus appStatus;
  final DocumentModel? documentModel;


  const DocumentState(  {
    this.documentModel,
    this.appStatus = AppStatus.initial,
  });

  DocumentState copyWith({
    final AppStatus? appStatus,
    final DocumentModel? documentModel,
    final FollowUpModel? followUp,
    final MedicationModel? medicationModel,
    final WoundDescribeReportModel? woundDescribeReportModel
  }) {
    return DocumentState(
      appStatus: appStatus ?? this.appStatus,
      documentModel: documentModel ?? this.documentModel,

    );
  }

  @override
  List<Object> get props =>
      [appStatus, documentModel ?? {}];
}
