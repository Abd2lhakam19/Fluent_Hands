import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'core/cashe/cashe_helper.dart';
import 'fluent_hands.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const FluentHands(),
    ),
  );
}
