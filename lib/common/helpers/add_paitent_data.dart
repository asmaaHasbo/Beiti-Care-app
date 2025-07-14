import 'dart:io';

import 'package:beiti_care/feature/auth/presentation/pages/otp_verification_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../constants/route.dart';

class AddPatentData {
  static Future<Map<String, dynamic>> addPaitentData(
      String client,
      String name,
      String code,

      String date,
      BuildContext context,
      File? image,
      ) async {
 print('ppppppppppppppp');
    final apiUrl = Uri.parse('${EndPoints.baseUrl}patientData/add');

    try {
      var request = http.MultipartRequest('POST', apiUrl)

        ..fields.addAll({
          'client': client,
          'date': date,
          'code':code,

          'name':name,
        });

      if (image != null) {
        print(image);
        request.files.add(await http.MultipartFile.fromPath(
          'videoOrPhotos',
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
        return data;
      } else {
        final errorResponse = json.decode(responseBody);

        _showErrorMessage( errorResponse['errors'][0]['msg']);
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