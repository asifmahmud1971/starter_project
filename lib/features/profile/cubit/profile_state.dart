part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final AppStatus appStatus;
  final AppStatus emailState;
  final String emailErr;
  final AppStatus passwordState;
  final String passwordErr;
  final ProfileDetails? profileDetails;

  const ProfileState( {
    this.appStatus = AppStatus.initial,
    this.emailState = AppStatus.initial,
    this.emailErr = '',
    this.passwordState = AppStatus.initial,
    this.passwordErr = '',
    this.profileDetails,
  });

  ProfileState copyWith({
    final AppStatus? appStatus,
    final AppStatus? emailState,
    final String? emailErr,
    final AppStatus? passwordState,
    final String? passwordErr,
    final ProfileDetails? profileDetails
  }) {
    return ProfileState(
      appStatus: appStatus ?? this.appStatus,
      emailState: emailState ?? this.emailState,
      emailErr: emailErr ?? this.emailErr,
      passwordState: passwordState ?? this.passwordState,
      passwordErr: passwordErr ?? this.passwordErr,
      profileDetails: profileDetails ?? this.profileDetails,
    );
  }

  @override
  List<Object> get props => [
    appStatus,
    emailState,
    emailErr,
    passwordState,
    passwordErr,
    profileDetails??{}
  ];
}
