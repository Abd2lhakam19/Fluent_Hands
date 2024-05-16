import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/api_consumer.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/core/error/exceptions.dart';
import 'package:fluent_hands/features/home/data/models/home_model.dart';

class HomeRepo {
  ApiConsumer api;
  HomeRepo({required this.api});
  Future<Either<String, HomeModel>> getPredict({
    required XFile image,
  }) async {
    try {
      final response = await api.post(
        EndPoints.modelBaseUrl + EndPoints.predict,
        data: {
          "image": await MultipartFile.fromFile(image.path),
        },
        isFormData: true,
      );
      final model = HomeModel.fromJson(response);
      return right(model);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }
}
