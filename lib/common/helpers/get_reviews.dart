// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/route.dart';

// import '../../services/language_service.dart';

class GetAllReviews {
  static Future<Map<String, dynamic>> getReviews(String id) async {
    final apiUrl = Uri.parse('${EndPoints.baseUrl}nurse/reviews/$id');

    try {
      final response = await http.get(apiUrl, headers: {});

      print('HTTP Response: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        print('Country List fetched successfully');
        final Map<String, dynamic> data = json.decode(response.body);

        // Now you can iterate through countries and handle each country

        // Handle each country as needed
        print(': $data');

        return data; // Return the entire list if needed
      } else {
        print('Response does not contain the expected  data structure.');
        return {};
      }
    } catch (error) {
      print('Error while fetching  List: $error');
      return {};
    }
  }
}
