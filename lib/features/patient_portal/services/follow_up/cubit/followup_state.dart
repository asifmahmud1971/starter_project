part of 'followup_cubit.dart';

class FollowUpState extends Equatable {
  final AppStatus appStatus;
  final FollowUpModel? followUp;
  final List<Followup>? followupList;

  const FollowUpState({
    this.appStatus = AppStatus.initial,
    this.followUp,
    this.followupList,
  });

  FollowUpState copyWith(
      {final AppStatus? appStatus,
      final FollowUpModel? followUp,
      final List<Followup>? followupList}) {
    return FollowUpState(
      appStatus: appStatus ?? this.appStatus,
      followUp: followUp ?? this.followUp,
      followupList: followupList ?? this.followupList,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        followUp ?? {},
        followupList ?? [],
      ];
}
