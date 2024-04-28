import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:fluent_hands/bloc_ops.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/cashe/cashe_helper.dart';
import 'fluent_hands.dart';
late List<CameraDescription>? cameras;

void main() async {
  Bloc.observer=MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  cameras = await availableCameras();
  runApp(
    const FluentHands()
  );
}
