import 'package:fluent_hands/core/api/end_points.dart';

class SingInModel {
  final String token;
  SingInModel({required this.token});
  factory SingInModel.fromJson(Map<String, dynamic> jsonData) {
    return SingInModel(
      token: jsonData[ApiKey.token],
    );
  }
}
