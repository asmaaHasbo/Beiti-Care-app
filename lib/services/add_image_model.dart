import 'dart:convert';

AddImageModel addImageModelFromJson(String str) => AddImageModel.fromJson(json.decode(str));

String addImageModelToJson(AddImageModel data) => json.encode(data.toJson());

class AddImageModel {
  String message;
  // List<User> users;
  Data data;

  AddImageModel({
    required this.message,
    required this.data,

  });

  factory AddImageModel.fromJson(Map<String, dynamic> json) => AddImageModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),

  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),

  };
}

class Data {
  String status;
  String id;
  String userName;
  String email;
  String password;
  String role;
  String phone;
  String image;
  String cv;
  String experience;
  List<String> specialty;
  String location;
  String idCard;
  List<dynamic> clients;
  int rating;
  List<String> language;
  int completedSessions;
  bool confirmed;
  List<dynamic> reviews;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  bool available;

  Data({
    required this.status,
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.role,
    required this.phone,
    required this.image,
    required this.cv,
    required this.experience,
    required this.specialty,
    required this.location,
    required this.idCard,
    required this.clients,
    required this.rating,
    required this.language,
    required this.completedSessions,
    required this.confirmed,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.available,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    id: json["_id"],
    userName: json["userName"],
    email: json["email"],
    password: json["password"],
    role: json["role"],
    phone: json["phone"],
    image: json["image"],
    cv: json["cv"],
    experience: json["experience"],
    specialty: List<String>.from(json["specialty"].map((x) => x)),
    location: json["location"],
    idCard: json["idCard"],
    clients: List<dynamic>.from(json["clients"].map((x) => x)),
    rating: json["rating"],
    language: List<String>.from(json["language"].map((x) => x)),
    completedSessions: json["completedSessions"],
    confirmed: json["confirmed"],
    reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    available: json["available"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "_id": id,
    "userName": userName,
    "email": email,
    "password": password,
    "role": role,
    "phone": phone,
    "image": image,
    "cv": cv,
    "experience": experience,
    "specialty": List<dynamic>.from(specialty.map((x) => x)),
    "location": location,
    "idCard": idCard,
    "clients": List<dynamic>.from(clients.map((x) => x)),
    "rating": rating,
    "language": List<dynamic>.from(language.map((x) => x)),
    "completedSessions": completedSessions,
    "confirmed": confirmed,
    "reviews": List<dynamic>.from(reviews.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "available": available,
  };
}

