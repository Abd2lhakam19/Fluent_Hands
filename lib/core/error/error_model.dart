class ErrorModel {
  final String status;
  final String errorMessage;

  ErrorModel({
    required this.status,
    required this.errorMessage,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData['status'] ?? "",
      errorMessage: jsonData['message'] ?? "",
    );
  }
}
