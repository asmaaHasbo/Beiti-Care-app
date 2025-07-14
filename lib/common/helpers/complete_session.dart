import 'dart:developer';

import 'package:beiti_care/feature/auth/presentation/pages/otp_verification_screen.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../feature/home/presentation/screens/patient_data_screen.dart';
import '../constants/route.dart';

class CompleteSession {
  static Future<void> complete(
String idSession,
    BuildContext context,
  ) async {
    print('ppppppppppppppp');

    final apiUrl = Uri.parse('${EndPoints.baseUrl}session/complete/$idSession');

    try {
      final response = await http.put(apiUrl,

          headers: {
            'Accept': "application/json",
            "Content-Type": "application/json"
          });

      print('HTTP Response: ${response.statusCode}');

      print('HTTP Response: ${response.body}');

      if (response.statusCode == 200) {
         final Map<String, dynamic> data = json.decode(response.body);
         String idClient = data['session']['client'];
        log(idClient);
        _showSuccessMessage('تمت العملية بنجاح');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PatientDataScreen(id: idClient,  )));    } else {
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
