class UserModel {
  final bool success;
  final UserData data;

  UserModel({required this.success, required this.data});

  // Convert JSON to Dart model manually
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      success: json['success'] as bool,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  // Convert Dart model to JSON manually
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final String status;
  final bool available;
  final List<dynamic> clients; // Replace with a specific model if needed
  final double rating;
  final List<String> language;
  final int completedSessions;
  final bool confirmed;
  final String id; // '_id' in JSON
  final String userName;
  final String email;
  final String role;
  final String phone;
  final String image;
  final String experience;
  final String location;
  final String idCard;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<dynamic> reviews; // Replace with a specific model if needed

  UserData({
    required this.status,
    required this.available,
    required this.clients,
    required this.rating,
    required this.language,
    required this.completedSessions,
    required this.confirmed,
    required this.id,
    required this.userName,
    required this.email,
    required this.role,
    required this.phone,
    required this.image,
    required this.experience,
    required this.location,
    required this.idCard,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
  });

  // Convert JSON to Dart model manually
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      status: json['status'] as String,
      available: json['available'] as bool,
      clients: json['clients'] as List<dynamic>,
      rating: (json['rating'] as num).toDouble(),
      language: (json['language'] as List<dynamic>).cast<String>(),
      completedSessions: json['completedSessions'] as int,
      confirmed: json['confirmed'] as bool,
      id: json['_id'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      experience: json['experience'] as String,
      location: json['location'] as String,
      idCard: json['idCard'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      reviews: json['reviews'] as List<dynamic>,
    );
  }

  // Convert Dart model to JSON manually
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'available': available,
      'clients': clients,
      'rating': rating,
      'language': language,
      'completedSessions': completedSessions,
      'confirmed': confirmed,
      '_id': id,
      'userName': userName,
      'email': email,
      'role': role,
      'phone': phone,
      'image': image,
      'experience': experience,
      'location': location,
      'idCard': idCard,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'reviews': reviews,
    };
  }
}