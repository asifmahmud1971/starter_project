part of 'investigation_cubit.dart';

class InvestigationState extends Equatable {
  final AppStatus appStatus;

  final InvestigationsResponse? investigationsResponse;

  const InvestigationState( {
    this.appStatus = AppStatus.initial,
    this.investigationsResponse,
  });

  InvestigationState copyWith({
    final AppStatus? appStatus,
    final InvestigationsResponse? investigationsResponse
  }) {
    return InvestigationState(
      appStatus: appStatus ?? this.appStatus,
      investigationsResponse: investigationsResponse ?? this.investigationsResponse,
    );
  }

  @override
  List<Object> get props => [
    appStatus,
    investigationsResponse??{}
  ];
}
