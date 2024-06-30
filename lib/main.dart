import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluent_hands/bloc_ops.dart';
import 'package:fluent_hands/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cashe/cashe_helper.dart';
import 'fluent_hands.dart';

late List<CameraDescription>? cameras;

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CacheHelper().init();
  cameras = await availableCameras();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AE')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en', 'US'),
      child: const FluentHands()));
}