
class NurseModel {
  final String id;
  final String userName;
  final String email;
  final String phone;
  final String image;
  final String experience;
  final String location;
  final List<String> language;
  final bool available;
  final String status;
  final bool confirmed;
  final String? cv;
  final List<String> specialty;
  final List<String> clients;
  final int rating;
  final int completedSessions;
  final List<Review> reviews;

  NurseModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phone,
    required this.image,
    required this.experience,
    required this.location,
    required this.language,
    required this.available,
    required this.status,
    required this.confirmed,
    this.cv,
    required this.specialty,
    required this.clients,
    required this.rating,
    required this.completedSessions,
    required this.reviews,
  });

  factory NurseModel.fromJson(Map<String, dynamic> json) {
    return NurseModel(
      id: json['_id'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      image: json['image'] ?? '',
      experience: json['experience'] ?? '',
      location: json['location'] ?? '',
      language: List<String>.from(json['language'] ?? []),
      available: json['available'] ?? false,
      status: json['status'] ?? '',
      confirmed: json['confirmed'] ?? false,
      cv: json['cv'],
      specialty: List<String>.from(json['specialty'] ?? []),
      clients: List<String>.from(json['clients'] ?? []),
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      completedSessions: (json['completedSessions'] as num?)?.toInt() ?? 0,
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((item) => Review.fromJson(item))
              .toList() ??
          [],
    );
  }
}

class Review {
  final String client;
  final String comment;
  final int rating;
  final String id;
  final String createdAt;

  Review({
    required this.client,
    required this.comment,
    required this.rating,
    required this.id,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      client: json['client'] ?? "",
      comment: json['comment'] ?? "",
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      id: json['_id'] ?? "",
      createdAt: json['createdAt'] ?? "",
    );
  }
}
