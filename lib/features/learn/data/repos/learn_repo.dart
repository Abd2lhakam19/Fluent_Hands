import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/api_consumer.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/core/error/exceptions.dart';
import 'package:fluent_hands/features/learn/data/models/learn_response.dart';

class LearnRepo {
  ApiConsumer api;
  LearnRepo({required this.api});

  Future<Either<String, LearnResponse>> getWords() async {
    try {
      final response =
          await api.get(EndPoints.baseUrl + EndPoints.getCategoryWelcome,
              options: Options(headers: {
                'Authorization': EndPoints.basicAuth,
              }));
      final model = LearnResponse.fromJson(response);
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, LearnResponse>> getGeneral() async {
    try {
      final response =
          await api.get(EndPoints.baseUrl + EndPoints.getCategoryGeneral,
              options: Options(headers: {
                'Authorization': EndPoints.basicAuth,
              }));
      final model = LearnResponse.fromJson(response);
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }

  Future<Either<String, LearnResponse>> getTraffic() async {
    try {
      final response =
          await api.get(EndPoints.baseUrl + EndPoints.getCategoryTraffic,
              options: Options(headers: {
                'Authorization': EndPoints.basicAuth,
              }));
      final model = LearnResponse.fromJson(response);
      return Right(model);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage);
    }
  }
}
