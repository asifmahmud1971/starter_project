part of 'document_cubit.dart';

class DocumentState extends Equatable {
  final AppStatus appStatus;
  final DocumentModel? documentModel;
  final UploadDataModel? uploadData;
  final double? uploadProgress;
  final String? uploadProgressString;
  final String? errorMessage;

  const DocumentState({
    this.documentModel,
    this.appStatus = AppStatus.initial,
    this.uploadProgress,
    this.uploadData,
    this.uploadProgressString,
    this.errorMessage,
  });

  DocumentState copyWith({
    final AppStatus? appStatus,
    final DocumentModel? documentModel,
    final UploadDataModel? uploadData,
    final double? uploadProgress,
    final String? uploadProgressString,
    final FollowUpModel? followUp,
    final MedicationModel? medicationModel,
    final WoundDescribeReportModel? woundDescribeReportModel,
    final String? errorMessage,
  }) {
    return DocumentState(
      appStatus: appStatus ?? this.appStatus,
      documentModel: documentModel ?? this.documentModel,
      uploadData: uploadData ?? this.uploadData,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      uploadProgressString: uploadProgressString ?? this.uploadProgressString,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        documentModel ?? {},
        uploadData ?? {},
        uploadProgress ?? 0.0,
        uploadProgressString ?? "0.0%",
        errorMessage ?? ""
      ];
}
