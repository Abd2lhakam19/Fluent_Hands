class ErrorModel {
  final String status;
  final String errorMessage;
  final String listErrors;

  ErrorModel({
    required this.status,
    required this.errorMessage,
    required this.listErrors,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData['status'],
      errorMessage: jsonData['message'],
      listErrors: jsonData['listerrors'],
    );
  }
}
