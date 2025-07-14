class ServiceModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String duration;
  final String? icon;
  final int? offer;
  final List<Subcategory> subcategories;
  final DateTime createdAt;
  final DateTime updatedAt;

  ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.duration,
    required this.subcategories,
    required this.createdAt,
    required this.updatedAt,
    this.icon,
    this.offer,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      duration: json['duration'],
      icon: json['icon'],
      offer: json['offer'],
      subcategories: (json['subcategories'] as List)
          .map((e) => Subcategory.fromJson(e))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'duration': duration,
        'icon': icon,
        'offer': offer,
        'subcategories': subcategories.map((e) => e.toJson()).toList(),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}

class Subcategory {
  final String id;
  final String name;
  final double cashPrice;
  final double bookingPrice;
  final int duration;

  Subcategory({
    required this.id,
    required this.name,
    required this.cashPrice,
    required this.bookingPrice,
    required this.duration,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['_id'],
      name: json['name'],
      cashPrice: (json['cashPrice'] as num).toDouble(),
      bookingPrice: (json['bookingPrice'] as num).toDouble(),
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'cashPrice': cashPrice,
        'bookingPrice': bookingPrice,
        'duration': duration,
      };
}
