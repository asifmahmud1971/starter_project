part of 'rehab_pall_cubit.dart';

class RehabPallState extends Equatable {
  final AppStatus appStatus;
  final RehabPallCareResponse? rehabPallCareResponse;
  final RehabPallVideoResponse? rehabPallVideoResponse;

  const RehabPallState({
    this.appStatus = AppStatus.initial,
    this.rehabPallCareResponse,
    this.rehabPallVideoResponse,
  });

  RehabPallState copyWith(
      {final AppStatus? appStatus,
      final RehabPallCareResponse? rehabPallCareResponse,
      final RehabPallVideoResponse? rehabPallVideoResponse}) {
    return RehabPallState(
      appStatus: appStatus ?? this.appStatus,
      rehabPallCareResponse:
          rehabPallCareResponse ?? this.rehabPallCareResponse,
      rehabPallVideoResponse:
          rehabPallVideoResponse ?? this.rehabPallVideoResponse,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        rehabPallCareResponse ?? {},
        rehabPallVideoResponse ?? {},
      ];
}
