part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final AppStatus appStatus;



  const SignInState({
    this.appStatus = AppStatus.initial,
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
    );
  }

  @override
  List<Object> get props => [
        appStatus,
      ];
}
