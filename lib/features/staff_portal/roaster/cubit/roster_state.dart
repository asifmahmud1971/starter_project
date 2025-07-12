part of 'roster_cubit.dart';

class RosterState extends Equatable {
  final AppStatus appStatus;
  final RosterModel? rosterModel;

  const RosterState({
    this.appStatus = AppStatus.initial,
    this.rosterModel,
  });

  RosterState copyWith({
    final AppStatus? appStatus,
    final RosterModel? rosterModel,
  }) {
    return RosterState(
      appStatus: appStatus ?? this.appStatus,
      rosterModel: rosterModel ?? this.rosterModel,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        rosterModel ?? {},
      ];
}
