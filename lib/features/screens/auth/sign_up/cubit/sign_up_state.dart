part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final AppStatus appStatus;
  final bool isCalenderVisible;
  final AppStatus nameState;
  final String nameErr;
  final AppStatus emailState;
  final String emailErr;
  final AppStatus dobState;
  final AppStatus genderState;

  const SignUpState({
    this.appStatus = AppStatus.initial,
    this.isCalenderVisible = false,
    this.nameState = AppStatus.initial,
    this.nameErr = '',
    this.emailState = AppStatus.initial,
    this.emailErr = '',
    this.dobState = AppStatus.initial,
    this.genderState = AppStatus.initial,
  });

  SignUpState copyWith({
    final AppStatus? appStatus,
    final bool? isCalenderVisible,
    final AppStatus? nameState,
    final String? nameErr,
    final AppStatus? emailState,
    final String? emailErr,
    final AppStatus? dobState,
    final AppStatus? genderState,
  }) {
    return SignUpState(
      appStatus: appStatus ?? this.appStatus,
      isCalenderVisible: isCalenderVisible ?? this.isCalenderVisible,
      nameState: nameState ?? this.nameState,
      nameErr: nameErr ?? this.nameErr,
      emailState: emailState ?? this.emailState,
      emailErr: emailErr ?? this.emailErr,
      dobState: dobState ?? this.dobState,
      genderState: genderState ?? this.genderState,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        isCalenderVisible,
        nameState,
        nameErr,
        emailState,
        emailErr,
        dobState,
        genderState,
      ];
}
