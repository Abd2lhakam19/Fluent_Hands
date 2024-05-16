import 'dart:convert';

class EndPoints {
  static String baseUrl = "http://ziadsalah9-001-site1.anytempurl.com";
  static String signUp = "/api/Account/Register";
  static String signIn = "/api/Account/Login";
  static String getCategoryDirections =
          "/api/LearningCategoryDirections/getallDirectionsRecoreds",
      getCategoryWelcome =
          "/api/LearningCategoryWelcome/getallWelcomesRecoreds",
      getCategoryGeneral =
          "/api/LearningGeneralWordsCategory/getallGeneralWordsRecoreds",
      getCategoryTraffic =
          "/api/LearningTrafficAndTransPortCategory/getallTrafficRecoreds",
      modelBaseUrl = "http://localhost:5000",
      predict = "/recognize";
  static String basicAuth =
      'Basic ${base64Encode(utf8.encode('11165423:60-dayfreetrial'))}';
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "message";
  static String listErrors = "listerrors";
  static String message = "message";
  static String email = "email";
  static String password = "password";
  static String name = "User_name";
  static String confirmPassword = "confirmPassword";
  static String role = "Role";
  static String token = "token";
  static String error = "Error";
  static String success = "Success";
}
