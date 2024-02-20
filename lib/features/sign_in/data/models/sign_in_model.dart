import 'package:fluent_hands/core/api/end_points.dart';

class SingInModel {
  final String token;
  final String status;
  final String message;
  List<dynamic> listErrors;
  SingInModel(
      {required this.token,
      required this.status,
      required this.message,
      required this.listErrors});
  factory SingInModel.fromJson(Map<String, dynamic> jsonData) {
    return SingInModel(
      token: jsonData[ApiKey.token] ?? "",
      status: jsonData[ApiKey.status] ?? "",
      message: jsonData[ApiKey.message] ?? "",
      listErrors: jsonData[ApiKey.listErrors] ?? [],
    );
  }
}
