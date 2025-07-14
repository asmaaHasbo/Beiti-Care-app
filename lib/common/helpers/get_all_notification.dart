import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../core/di/di_container.dart';
import '../../feature/app/domain/repo/preferences_repository.dart';
import '../constants/route.dart';

// import '../../services/language_service.dart';

class GetAllNotification {
  static Future<Map<String, dynamic>> allNotification() async {
    final String? id = getIt<PreferencesRepository>().getString('idUser');

    final apiUrl = Uri.parse('${EndPoints.baseUrl}/api/notification/$id');

    try {
      final response = await http.get(apiUrl, headers: {});

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
