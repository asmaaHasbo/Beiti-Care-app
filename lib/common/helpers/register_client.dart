import 'package:beiti_care/feature/auth/presentation/pages/otp_verification_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/route.dart';

class RegisterClient {
  static Future<void> registerClient(
    String userName,
    String email,
    String password,
    String phone,
    int age,
    int years,
    String gender,
    BuildContext context,
  ) async {
    print('ppppppppppppppp');

    final apiUrl = Uri.parse('${EndPoints.baseUrl}client/create');

    try {
      final response = await http.post(apiUrl,
          body: jsonEncode({
            "userName": userName,
            "email": email,
            "password": password,
            "role": "client",
            "phone": phone,
            "gender": gender == 'feminine' ? 'Female' : 'Male',
            "age": age,
            "years": years
          }),
          headers: {
            'Accept': "application/json",
            "Content-Type": "application/json"
          });

      print('HTTP Response: ${response.statusCode}');
      print('HTTP Response: ${json.encode({
            "userName": userName,
            "email": email,
            "password": password,
            "role": "client",
            "phone": phone,
            "gender": gender,
            "age": age,
            "years": years
          })}');
      print('HTTP Response: ${response.body}');

      if (response.statusCode == 201) {
        _showSuccessMessage('تمت العملية بنجاح');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OtpVerificationScreen(phoneNumber: phone)));
      } else {
        print('errror }');
        final Map<String, dynamic> data = json.decode(response.body);
        print('HTTP Response: $data');

        _showErrorMessage(data['errors'][0]['msg']);
      }
    } catch (error) {
      print('errror $error');
      _showErrorMessage('خطأ في الشبكة: $error');
    }
  }

  static void _showSuccessMessage(String message) {
    BotToast.showText(text: message);
  }

  static void _showErrorMessage(String message) {
    BotToast.showText(text: message);
  }
}
