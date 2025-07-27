part of 'followup_cubit.dart';

class StaffFollowUpState extends Equatable {
  final AppStatus appStatus;
  final FollowUpModel? followUp;
  final List<Followup>? followupList;

  const StaffFollowUpState({
    this.appStatus = AppStatus.initial,
    this.followUp,
    this.followupList,
  });

  StaffFollowUpState copyWith(
      {final AppStatus? appStatus,
      final FollowUpModel? followUp,
      final List<Followup>? followupList}) {
    return StaffFollowUpState(
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
