import 'dart:io';

import 'package:beiti_care/feature/auth/presentation/pages/otp_verification_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import '../constants/route.dart';

class RegisterNurse {
  static Future<Map<String, dynamic>> registerNurse(
    String userName,
    String email,
    String password,
    String phone,
    String experience,
    String specialty,
    String location,
    String idCard,
    BuildContext context,
    File? image,
  ) async {
    print('ppppppppppppppp');

    final apiUrl = Uri.parse('${EndPoints.baseUrl}nurse/register');

    try {
      var request = http.MultipartRequest('POST', apiUrl)
        ..fields.addAll({
          'role': 'nurse',
          'idCard': idCard,
          'location': location,
          'specialty[]': specialty, // ✅ يُنتج ["value"] بصيغة JSON صالحة
          'experience': experience,
          'phone': phone,
          'password': password,
          'email': email,
          'userName': userName,
          'about': 'mm'
        });

      if (image != null) {
        print(image);
        request.files.add(await http.MultipartFile.fromPath(
          'image',
          image.path,
          contentType: MediaType('image', 'jpg'), // تعديل حسب نوع الملف
        ));
      }

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      print('HTTP Response: ${response.statusCode}');
      print('Response Body: $responseBody');
      print('Response Body: ${request.fields}');

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(responseBody);
        _showSuccessMessage(data['message'] ?? 'تمت العملية بنجاح');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OtpVerificationScreen(phoneNumber: phone)));
        return data;
      } else {
        final errorResponse = json.decode(responseBody);

        _showErrorMessage(errorResponse['errors'][0]['msg']);
        return {};
      }
    } catch (error) {
      _showErrorMessage('خطأ في الشبكة: $error');
      return {};
    }
  }

  static void _showSuccessMessage(String message) {
    BotToast.showText(text: message);
  }

  static void _showErrorMessage(String message) {
    BotToast.showText(text: message);
  }
}
