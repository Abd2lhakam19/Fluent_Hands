abstract class HomeStates {}

class SuccessScannedState extends HomeStates {
  String message;
  SuccessScannedState({required this.message});
}

class FailureScannedState extends HomeStates {}

class LoadingScannedState extends HomeStates {}

class SuccessRecordingState extends HomeStates {
  String message;

  SuccessRecordingState({required this.message});
}

class FailureRecordingState extends HomeStates {}

class LoadingRecordingState extends HomeStates {}

class SuccessDataState extends HomeStates {}

class FailureDataState extends HomeStates {}

class LoadingDataState extends HomeStates {}
