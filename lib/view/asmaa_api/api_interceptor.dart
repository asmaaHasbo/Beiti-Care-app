// ignore_for_file: avoid_print

import 'package:beiti_care/common/constants/prefs_key.dart';
import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  
   print('Request URL: ${options.uri}');
    print('Request Headers: ${options.headers}');
    final token = getIt<PreferencesRepository>().getString(PrefsKey.token);
    print('Token: $token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      print('Authorization Header: ${options.headers['Authorization']}');
    }


 if (options.data is FormData) {
      options.headers['content-type'] = 'multipart/form-data';
      final FormData formData = options.data as FormData;
      print('FormData fields: ${formData.fields}');
      print('FormData files: ${formData.files.map((file) => {
            'filename': file.value.filename,
            'contentType': file.value.contentType?.toString(),
            'length': file.value.length
          }).toList()}');
    }

    handler.next(options);
  }


@override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response received: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('DioError: ${err.message}, Type: ${err.type}, Response: ${err.response}');
    handler.next(err);
  }

}
