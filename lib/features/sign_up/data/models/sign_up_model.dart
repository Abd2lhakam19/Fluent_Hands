import 'package:fluent_hands/core/api/end_points.dart';

class SingUpModel {
  final String status;
  final String message;
  final List<String> listErrors;
  SingUpModel(
      {required this.message, required this.status, required this.listErrors});
  factory SingUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SingUpModel(
        message: jsonData[ApiKey.message] ?? "",
        status: jsonData[ApiKey.status] ?? "",
        listErrors: jsonData[ApiKey.listErrors] ?? []);
  }
}
