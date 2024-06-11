class SignUpStates {}

final class SignUpInitial extends SignUpStates {}

final class SignUpSuccess extends SignUpStates {
  String successMessage;

  SignUpSuccess({required this.successMessage});
}

final class SignUpLoading extends SignUpStates {}

final class SignUpFailure extends SignUpStates {
  final String errormessage;
  SignUpFailure({required this.errormessage});
}
