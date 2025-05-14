part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final AppStatus appStatus;

  final AppStatus emailState;
  final String emailErr;

  final AppStatus passwordState;
  final String passwordErr;

  const SignInState({
    this.appStatus = AppStatus.initial,
    this.emailState = AppStatus.initial,
    this.emailErr = '',
    this.passwordState = AppStatus.initial,
    this.passwordErr = '',
  });

  SignInState copyWith({
    final AppStatus? appStatus,
    final AppStatus? emailState,
    final String? emailErr,
    final AppStatus? passwordState,
    final String? passwordErr,
  }) {
    return SignInState(
      appStatus: appStatus ?? this.appStatus,
      emailState: emailState ?? this.emailState,
      emailErr: emailErr ?? this.emailErr,
      passwordState: passwordState ?? this.passwordState,
      passwordErr: passwordErr ?? this.passwordErr,
    );
  }

  @override
  List<Object> get props => [
    appStatus,
    emailState,
    emailErr,
    passwordState,
    passwordErr,
  ];
}
