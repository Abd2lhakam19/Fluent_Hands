import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/api_consumer.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/core/error/exceptions.dart';
import 'package:fluent_hands/features/sign_up/data/models/sign_up_model.dart';

class SingUpRepo {
  ApiConsumer api;
  SingUpRepo({required this.api});
  Future<Either<String, SingUpModel>> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
  }) async {
    try {
      final response = await api.post(EndPoints.baseUrl+EndPoints.signUp, queryParameters: {
        ApiKey.role: role,
        ApiKey.name: name,
      }, data: {
        ApiKey.email: email,
        ApiKey.password: password,
        ApiKey.confirmPassword: confirmPassword,
      },
      options: Options(
        headers: {
          //'Content-Type':'application/json',
          'Authorization': EndPoints.basicAuth
        }
      ));
      final signUpModel = SingUpModel.fromJson(response);
     // print(response);
      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
