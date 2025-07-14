import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'client_config.dart';
import 'exceptions.dart';

typedef HttpLibraryMethodInvocation<T> = Future<Response<T>> Function();

@injectable
class ClientApi {
  final Dio _client;

  ClientApi(this._client);

  Future<Response<T>> request<T>(
    RequestConfig<T> settings, {
    final ProgressCallback? onReceiveProgress,
    final ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    Response<T> response;
    final queryParameters = settings.queryParameters;
    final data = settings.data;
    final endpoint = settings.endpoint;

    final baseUrl = Uri.parse(_client.options.baseUrl);

    final requestUrl = Uri(
      path: baseUrl.path + endpoint,
      queryParameters: queryParameters,
      host: baseUrl.host,
      scheme: baseUrl.scheme,
      port: baseUrl.port,
    );
    switch (settings.clientMethod) {
      case ClientMethod.get:
        function() => _client.getUri<T>(requestUrl,
            onReceiveProgress: onReceiveProgress,
            data: data,
            cancelToken: cancelToken);

        response = await _mapException<T>(function);
        break;
      case ClientMethod.post:
        function() => _client.postUri<T>(requestUrl,
            onReceiveProgress: onReceiveProgress,
            onSendProgress: onSendProgress,
            data: data,
            cancelToken: cancelToken);

        response = await _mapException<T>(function);
        break;
      case ClientMethod.put:
        function() => _client.putUri<T>(
              requestUrl,
              onReceiveProgress: onReceiveProgress,
              onSendProgress: onSendProgress,
              data: data,
            );
        response = await _mapException(function);
        break;
      case ClientMethod.patch:
        function() => _client.patchUri<T>(
          requestUrl,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          data: data,
        );
        response = await _mapException(function);
        break;
      case ClientMethod.delete:
        function() => _client.deleteUri<T>(requestUrl, data: data);
        response = await _mapException(function);
        break;
    }

    return response;
  }

  Future<Response<T>> _mapException<T>(
      HttpLibraryMethodInvocation<T> method) async {
    try {
      return await method();
    } on DioException catch (exception) {


      if (exception.response?.statusCode.toString().matchAsPrefix('5') !=
              null ||
          exception.message.toString().contains('500')) {
        throw AppNetworkException(
            reason: AppNetworkExceptionReason.serverError,
            exception: exception is Exception
                ? exception
                : Exception(
                    'Unknown error occurred, please contact your system administrator'
                        .tr()),
            message:
                "Unknown error occurred, please contact your system administrator"
                    .tr());
      }
      switch (exception.type) {

        case DioExceptionType.badResponse:
        // For DioErrorType.response, we are guaranteed to have a
        // response object present on the exception.
          final response = exception.response;
          if (response == null || response is! Response<T>) {
            // This should never happen, judging by the current source code
            // for Dio.
            throw AppNetworkResponseException(exception: exception);
          }
          if(exception.response?.statusCode==401){
            print('tesssssssssssssssssssst');
            if(exception.response?.data["msg"] != null) {
            if(exception.response?.data["message"] != null) {
              throw AppNetworkResponseException(
                exception: exception,
                message:exception.response?.data["message"],
                statusCode: response.statusCode,
                data: response.data,
              );
            }
            }
          }
         if(exception.response?.statusCode==404){
           if(exception.response?.data["message"] != null) {
             throw AppNetworkResponseException(
             exception: exception,
             message: exception.response?.data["message"],
             statusCode: response.statusCode,
             data: response.data,
           );
           }
         }
          final contentType = exception.requestOptions.headers['Content-Type'];
         if(contentType.contains('multipart/form-data')){
      throw AppNetworkResponseException(
      exception: exception,
      message: "Please try again later".tr(),
      statusCode: response.statusCode,
      data: response.data,
      );
      }
          if(exception.response?.statusCode==401&&!(exception.requestOptions.path.contains('login')||exception.requestOptions.path.contains('register'))){

            throw AppNetworkResponseException(
              exception: exception,
              message: "You must log in".tr(),
              statusCode: response.statusCode,
              data: response.data,
            );
          }
          if (exception.response?.data["errors"] != null) {
            Map<String, dynamic> errors = exception.response?.data['errors'];
            if (errors['error'] != null) {
              throw AppNetworkResponseException(
                exception: exception,
                message: errors['error'],
                statusCode: response.statusCode,
                data: response.data,
              );
            } else {
              String msg = errors.values.join("\n");
              throw AppNetworkResponseException(
                exception: exception,
                message: msg,
                statusCode: response.statusCode,
                data: response.data,
              );
            }
          }

          throw AppException.unknown(
            exception: exception is Exception
                ? exception
                : Exception(
                'Unknown error occurred, please contact your system administrator'
                    .tr()),
            message:
            "Unknown error occurred, please contact your system administrator"
                .tr(),
          );
        case DioExceptionType.cancel:
          throw AppNetworkException(
            reason: AppNetworkExceptionReason.canceled,
            message: AppNetworkExceptionReason.canceled.message.tr(),
            exception: exception,
          );
        case DioExceptionType.connectionTimeout:
          throw AppNetworkException(
              reason: AppNetworkExceptionReason.timedOut,
              message: AppNetworkExceptionReason.timedOut.message.tr(),
              exception: exception);
        case DioExceptionType.receiveTimeout:
          throw AppNetworkException(
              reason: AppNetworkExceptionReason.timedOut,
              message: AppNetworkExceptionReason.timedOut.message.tr(),
              exception: exception);
        case DioExceptionType.sendTimeout:
          throw AppNetworkException(
              reason: AppNetworkExceptionReason.timedOut,
              message: AppNetworkExceptionReason.timedOut.message.tr(),
              exception: exception);


        case DioExceptionType.unknown:
          throw AppException.unknown(
              exception: exception,
              message: 'Please check your internet connection'.tr());
        default:
          if (exception.error is SocketException) {
            throw AppNetworkException(
                reason: AppNetworkExceptionReason.noInternet,
                message: AppNetworkExceptionReason.noInternet.message.tr(),
                exception: exception);
          }
          throw AppException.unknown(
              exception: exception,
              message: 'Please check your internet connection'.tr());
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      throw AppException.unknown(
        exception: e is Exception
            ? e
            : Exception(
                'Unknown error occurred, please contact your system administrator'
                    .tr()),
        message:
            "Unknown error occurred, please contact your system administrator"
                .tr(),
      );
    }
  }
}
