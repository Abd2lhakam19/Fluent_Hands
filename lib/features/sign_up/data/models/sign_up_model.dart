import 'package:fluent_hands/core/api/end_points.dart';

class SingUpModel {
  final String message;
  SingUpModel({required this.message});
  factory SingUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SingUpModel(message: jsonData[ApiKey.errorMessage]);
  }
}
