import 'dart:io';

import 'package:beiti_care/common/constants/prefs_key.dart';
import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:beiti_care/services/language_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import '../../common/enums/status_code_type.dart';

enum _StatusType {
  succeed,
  failed,
}

class LoggerInterceptor extends Interceptor with LoggerHelper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.authorizationHeader] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZjMyY2MxMjVlOGE2YTBmY2IxMmNkYiIsImVtYWlsIjoiYWRtaW5AZ21haWwuY29tIiwicm9sZSI6IkFkbWluIiwiaWF0IjoxNzQ2MDM1ODA1LCJleHAiOjE3NDYwMzk0MDV9.QdXcWT-bOaRLgIoH5_Y2VZ2vwU_twyQ2jIT5go___mw';

    if (getIt<PreferencesRepository>().getString(PrefsKey.token) != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${getIt<PreferencesRepository>().getString(PrefsKey.token)}';
    }

    options.headers['locale'] = LanguageService.languageCode;

    if (kDebugMode) {
      prettyPrinterI("***|| INFO Request ${options.path} ||***"
          "\n HTTP Method: ${options.method}"
          "\n token : ${options.headers[HttpHeaders.authorizationHeader]?.substring(0, 20)}"
          "\n query param : ${options.queryParameters}"
          "\n param : ${options.data is FormData ? (options.data as FormData).fields : options.data}"
          "\n url: ${options.path}"
          "\n Header: ${options.headers}"
          "\n timeout: ${options.connectTimeout! ~/ 1000}s",
      );
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      _StatusType statusType;
      if (response.statusCode == StatusCode.success.code || response.statusCode == StatusCode.writeSuccess.code) {
        statusType = _StatusType.succeed;
      } else {
        statusType = _StatusType.failed;
      }
      final requestRoute = response.requestOptions.path;

      if (statusType == _StatusType.failed) {
        prettyPrinterError('***|| ${statusType.name.toUpperCase()} Response into -> $requestRoute ||***');
      } else {
        prettyPrinterV('***|| ${statusType.name.toUpperCase()} Response into -> $requestRoute ||***');
      }
      prettyPrinterWtf(
        "***|| INFO Response Request $requestRoute ${statusType == _StatusType.succeed ? '✊' : ''} ||***"
            "\n Status code: ${response.statusCode}"
            "\n Status message: ${response.statusMessage}"
            "\n Data: ${response.data}",
      );
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      prettyPrinterError(
        "***|| SOMETHING ERROR 💔 ||***"
            "\n error: ${err.error}"
            "\n response: ${err.response}"
            "\n message: ${err.message}"
            "\n type: ${err.type}"
            "\n stackTrace: ${err.stackTrace}",
      );
    }


    handler.next(err);
  }
}

mixin LoggerHelper {
  void prettyPrinterError(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).e(message);
  }

  void prettyPrinterWtf(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).wtf(message);
  }

  void prettyPrinterI(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).i(message);
  }

  void prettyPrinterV(final String message) {
    Logger(printer: PrettyPrinter(methodCount: 0)).v(message);
  }
}
