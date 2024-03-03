import 'package:camera/camera.dart';

abstract class HomeStates{}

class SuccessScannedState extends HomeStates{
  String message;
  SuccessScannedState({required this.message});
}

class FailureScannedState extends HomeStates{}

class LoadingScannedState extends HomeStates{}
class InitialCameraState extends HomeStates{
  final CameraController controller;
  InitialCameraState({required this.controller});
}
class CameraErrorState extends HomeStates{
  final String errorMessage;
  CameraErrorState({required this.errorMessage});
}


class TakePictureState extends HomeStates{}

class RotateCameraState extends HomeStates{}
