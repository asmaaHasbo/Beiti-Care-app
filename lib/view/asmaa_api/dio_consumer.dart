// ignore_for_file: avoid_print

import 'package:beiti_care/view/asmaa_api/api_consumer.dart';
import 'package:beiti_care/view/asmaa_api/api_endpoints.dart';
import 'package:beiti_care/view/asmaa_api/api_interceptor.dart';
import 'package:beiti_care/view/errors/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio = Dio();

  DioConsumer() {
    print(
        'Initializing DioConsumer with baseUrl: ${AsmaaApiEndpoints.baseUrl}');
    dio.options.baseUrl = AsmaaApiEndpoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.options.connectTimeout = Duration(seconds: 10); // إضافة timeout
    dio.options.receiveTimeout = Duration(seconds: 10);
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
  }

  @override
  delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    isFormData = false,
  }) async {
    try {
      return await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data!) : data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      dioExceptions(e);
    }
  }

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      print('Sending GET request to: $path'); // طباعة الـ path مباشرة
      print('Full URL: ${dio.options.baseUrl}$path');
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      print('Response Data: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      print(e.message );
      dioExceptions(e);
    }
  }

  @override
  patch(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    isFormData = false,
  }) async {
    try {
      print('Full URL: ${dio.options.baseUrl}$path');
      return await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data!) : data,
        queryParameters: queryParameters,
      );
      
    } on DioException catch (e) {
      dioExceptions(e);
    }
  }

  @override
  post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    isFormData = false,
  }) async {
    try {
      return await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data!) : data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      dioExceptions(e);
    }
  }
}
