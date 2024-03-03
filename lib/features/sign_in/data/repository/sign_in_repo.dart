import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/api_consumer.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/core/error/exceptions.dart';
import 'package:fluent_hands/features/sign_in/data/models/sign_in_model.dart';

import '../../../../core/cashe/cashe_helper.dart';

class SingInRepo {
  ApiConsumer api;
  SingInRepo({required this.api});

  Future<Either<String, SingInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(EndPoints.baseUrl+EndPoints.signIn, data: {
        ApiKey.email: email,
        ApiKey.password: password,
      },
        options: Options(
          headers: {
            'Authorization':EndPoints.basicAuth
          }
        )
      );

      final user = SingInModel.fromJson(response);

      // final decodedToken = JWT.decode(user.token);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
