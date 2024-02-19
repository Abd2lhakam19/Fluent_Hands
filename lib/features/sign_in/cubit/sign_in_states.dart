class SignInStates {}

final class SignInInitial extends SignInStates {}

final class SignInSuccess extends SignInStates {}

final class SignInLoading extends SignInStates {}

final class SignInFailure extends SignInStates {
  final String errormessage;
  SignInFailure({required this.errormessage});
}
