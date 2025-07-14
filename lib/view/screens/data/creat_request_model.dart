class CreatRequestModel {
  final String clientName;
  final String code;
  final String services;
  final String nurseName;
  final String status;
  final String paymentStatus;
  final int total;
  final DateTime date;

  CreatRequestModel({
    required this.clientName,
    required this.code,
    required this.services,
    required this.nurseName,
    required this.status,
    required this.paymentStatus,
    required this.total,
    required this.date,
  });

  factory CreatRequestModel.fromJson(Map<String, dynamic> json) {
    return CreatRequestModel(
      clientName: json['clientName'],
      code: json['code'],
      services: json['services'],
      nurseName: json['nurseName'],
      status: json['status'],
      paymentStatus: json['paymentStatus'],
      total: json['total'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientName': clientName,
      'code': code,
      'services': services,
      'nurseName': nurseName,
      'status': status,
      'paymentStatus': paymentStatus,
      'total': total,
      'date': date.toIso8601String(),
    };
  }
}

class CreateRequest {
  final String client;
  final String nurse;
  final String service;

  CreateRequest({
    required this.client,
    required this.nurse,
    required this.service,
  });

  Map<String, dynamic> toJson() {
    return {
      'client': client,
      'nurse': nurse,
      'service': service,
    };
  }
}
