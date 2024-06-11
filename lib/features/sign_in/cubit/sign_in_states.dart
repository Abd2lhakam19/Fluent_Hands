class SignInStates {}

final class SignInInitial extends SignInStates {}

final class SignInSuccess extends SignInStates {
  String successMessage;
  SignInSuccess({required this.successMessage});
}

final class SignInLoading extends SignInStates {}

final class SignInFailure extends SignInStates {
  String errormessage;
  SignInFailure({required this.errormessage});
}
