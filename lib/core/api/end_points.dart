import 'dart:convert';

class EndPoints {
  static String twitterApiKey = "fRhu55hab49mgIdgvoil5z4KN";
  static String twitterApiSecretKey =
          "jLlsh1MtQJPENNXCC5pzrqJJoyRCIEQCAjntl5SEDVAVErsz2g",
      modelBaseUrl =
          "https://5000-01j1yt8sz0172czjw396f92bpt.cloudspaces.litng.ai",
      predict = "/recognize",
      videoPredict = "/classify_video";
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
