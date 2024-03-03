import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluent_hands/core/api/api_consumer.dart';
import 'package:fluent_hands/core/api/api_interceptors.dart';
import 'package:fluent_hands/core/api/end_points.dart';
import 'package:fluent_hands/core/error/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {

    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    // dio.options.headers['Authorization'] = "Bacis " +
    //     base64Encode(
    //       utf8.encode('$Username:$Password'),
    //     );
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Options? options,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await dio.get(path,options: options);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Options? options,
  }) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post(
    String path, {
    dynamic? data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: options
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
