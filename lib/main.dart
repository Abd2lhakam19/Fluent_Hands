import 'package:flutter/material.dart';

import 'core/cash/cash_helper.dart';
import 'fluent_hands.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  CacheHelper().init();
  runApp(
    const FluentHands(),
  );
}
