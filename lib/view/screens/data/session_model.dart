import 'package:beiti_care/view/screens/data/nurse_model.dart';

class SessionModel {
  final String id;
  final String paymentStatus;
  final ServiceModel? service;
  final NurseModel? nurse;
  final String client;
  final String code;
  final String status;
  final DateTime createdAt;

  SessionModel({
    required this.id,
    required this.paymentStatus,
    this.service,
    this.nurse,
    required this.client,
    required this.code,
    required this.status,
    required this.createdAt,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      id: json['_id'] ?? "",
      paymentStatus: json['paymentStatus'] ?? "",
      service: json['service'] != null
          ? ServiceModel.fromJson(json['service'])
          : null,
      nurse: json['nurse'] != null
          ? NurseModel.fromJson(json['nurse'])
          : null,
      client: json['client'] ?? "",
      code: json['code'] ?? "",
      status: json['status'] ?? "",
      createdAt: json['createdAt'] != null && json['createdAt'].isNotEmpty
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }
}
class ServiceModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String duration;
  final List<Subcategory> subcategories;
  final String createdAt;
  final String updatedAt;
  final String icon;
  final double? offer;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.subcategories,
    required this.createdAt,
    required this.updatedAt,
    required this.icon,
    this.offer,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      duration: json['duration'] ?? "",
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((item) => Subcategory.fromJson(item))
              .toList() ??
          [],
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      icon: json['icon'] ?? "",
      offer: (json['offer'] as num?)?.toDouble(),
    );
  }
}
class Subcategory {
  final String name;
  final double cashPrice;
  final double bookingPrice;
  final int duration;
  final String id;

  Subcategory({
    required this.name,
    required this.cashPrice,
    required this.bookingPrice,
    required this.duration,
    required this.id,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      name: json['name'] ?? "",
      cashPrice: (json['cashPrice'] as num?)?.toDouble() ?? 0.0,
      bookingPrice: (json['bookingPrice'] as num?)?.toDouble() ?? 0.0,
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      id: json['_id'] ?? "",
    );
  }
}
