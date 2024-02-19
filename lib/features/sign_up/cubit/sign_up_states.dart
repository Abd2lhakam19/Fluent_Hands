class SignUpStates {}

final class SignUpInitial extends SignUpStates {}

final class SignUpSuccess extends SignUpStates {
  final String message;
  SignUpSuccess({required this.message});
}

final class SignUpLoading extends SignUpStates {}

final class SignUpFailure extends SignUpStates {
  final String errormessage;
  SignUpFailure({required this.errormessage});
}
