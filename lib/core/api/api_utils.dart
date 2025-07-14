import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:beiti_care/core/api/result.dart';
import 'exceptions.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Future<T> throwAppException<T>(FutureOr<T> Function() call) async {
  try {
    return (await call());
  } on AppException catch (e) {
    showMessage(e.message);
    rethrow;
  } on DioException catch (e) {
    showMessage(e.response?.data['errors']["email"]??e.response?.data['errors']['error'] ?? '');
    rethrow;
  } on SocketException catch (e) {
    showMessage(e.message);
    rethrow;
  } catch (e) {
    showMessage(e.toString());
     rethrow;
  }
}

void showMessage(String message, {bool isSuccess = false}) {

  // Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 7,
  //     backgroundColor: isSuccess ? Colors.greenAccent : Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0);
  BotToast.showCustomText(toastBuilder: (cancelFunc) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(width: 350,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(!isSuccess ? Icons.warning_amber_rounded : Icons.done, color:! isSuccess ? Colors.red : Colors.green, size: 30),
                const SizedBox(width: 10),
                SizedBox(width: 300,
                  child: Text(message, style: TextStyle(
                      overflow: TextOverflow.clip,
                      color: !isSuccess  ? Colors.red : Colors.green, fontWeight: FontWeight.bold, fontSize: 16.0)),
                ),
              ],
            ),
          ),
        ));
  });
}

Future<Result<T>> toApiResult<T>(FutureOr<T> Function() call) async {
  try {
    return Success(await call());
  } on AppNetworkResponseException catch (e) {
    if (e.data is! String) {
      return Failure(e, message: e.message);
    }
    return Failure(e, message: e.message);
  } on AppNetworkException catch (e) {
    final message = e.message;
    final appNetworkException = e.copyWith(message: message);
    return Failure(appNetworkException, message: message);
  } on AppException catch (e) {
    return Failure(e, message: e.message);
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    final exception = AppException.unknown(exception: e, message: e.toString());
    return Failure(exception, message: exception.message);
  }
}
