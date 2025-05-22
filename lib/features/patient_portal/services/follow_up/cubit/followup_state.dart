part of 'followup_cubit.dart';

class FollowUpState extends Equatable {
  final AppStatus appStatus;
  final FollowUpModel? followUp;

  const FollowUpState( {
    this.appStatus = AppStatus.initial,
    this.followUp,
  });

  FollowUpState copyWith({
    final AppStatus? appStatus,
    final FollowUpModel? followUp
  }) {
    return FollowUpState(
      appStatus: appStatus ?? this.appStatus,
      followUp: followUp ?? this.followUp,
    );
  }

  @override
  List<Object> get props =>
      [appStatus, followUp??{}];
}
