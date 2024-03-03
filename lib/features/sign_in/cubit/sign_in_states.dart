import '../data/models/sign_in_model.dart';

class SignInStates {}

final class SignInInitial extends SignInStates {}

final class SignInSuccess extends SignInStates {
  SingInModel response;
  SignInSuccess({required this.response});


}

final class SignInLoading extends SignInStates {}

final class SignInFailure extends SignInStates {
  final String errormessage;
  SignInFailure({required this.errormessage});
}
