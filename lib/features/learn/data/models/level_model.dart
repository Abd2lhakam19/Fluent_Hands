import 'package:fluent_hands/features/learn/data/models/learn_response.dart';

class LevelModel {
  String levelNum;
  String levelName;
  String levelDef;
  String levelLessons;
  List<ListSuccess>? response;
  LevelModel({
    required this.levelNum,
    required this.levelName,
    required this.levelDef,
    required this.levelLessons,
     this.response,
  });
}

