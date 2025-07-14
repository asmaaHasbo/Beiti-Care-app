import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/route.dart';

// import '../../services/language_service.dart';

class GetHelp {
  static Future<Map<String, dynamic>> about() async {
    final apiUrl = Uri.parse('${EndPoints.baseUrl}setting/getHelp');

    try {
      final response = await http.get(apiUrl, headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZjMyY2MxMjVlOGE2YTBmY2IxMmNkYiIsImVtYWlsIjoiYWRtaW5AZ21haWwuY29tIiwicm9sZSI6IkFkbWluIiwiaWF0IjoxNzQ2NTI5MTMzLCJleHAiOjE3NDY1MzI3MzN9.dK3l9qwDiQNs-a4cB_q91rZRAyytR0Pk13lypqFKfbw'
      });

      print('HTTP Response: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        print('Country List fetched successfully');
        final Map<String, dynamic> data = json.decode(response.body);

        // Now you can iterate through countries and handle each country

        // Handle each country as needed
        print('Country: $data');

        return data; // Return the entire list if needed
      } else {
        print(
            'Response does not contain the expected "countries" data structure.');
        return {};
      }
    } catch (error) {
      print('Error while fetching Country List: $error');
      return {};
    }
  }
}
