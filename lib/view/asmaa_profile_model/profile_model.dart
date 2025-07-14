import 'package:beiti_care/view/asmaa_api/api_endpoints.dart';

class UserProfileModel {
  final String? userName;
  final String? address;
  final String? email;
  final String? password;
  final String? image;
  final int? phone;

  UserProfileModel(
      {this.email,
      this.userName,
      this.address,
      this.password,
      this.phone,
      this.image});

  factory UserProfileModel.fromJson(Map<String, dynamic> jsonData) {
    final user = jsonData['updatedUser'] ?? jsonData['user']?? jsonData;
    if (user == null) {
      throw FormatException('User data is missing in response');
    }
    return UserProfileModel(
      userName: user[ApiKey.userName] as String? ?? 'Unknown',
      email: user[ApiKey.email] as String? ?? 'Unknown',
      address: user[ApiKey.address] as String? ?? 'Unknown',
      password: user[ApiKey.password] as String? ?? 'Unknown',
     phone: _parsePhone(user[ApiKey.phone]),
      image: user[ApiKey.image] as String?,
    );
  }

  static int? _parsePhone(dynamic phoneValue) {
    if (phoneValue == null) return null;
    if (phoneValue is int) return phoneValue;
    if (phoneValue is String) return int.tryParse(phoneValue);
    return null;
  }
}