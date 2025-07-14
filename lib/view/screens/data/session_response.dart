class SessionResponse {
  final bool success;
  final String message;
  final Session session;

  SessionResponse({
    required this.success,
    required this.message,
    required this.session,
  });

  factory SessionResponse.fromJson(Map<String, dynamic> json) {
    return SessionResponse(
      success: json['success'],
      message: json['message'],
      session: Session.fromJson(json['session']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'session': session.toJson(),
    };
  }
}

class Session {
  final String id;
  final String service;
  final String nurse;
  final String client;
  final String code;
  final String status;
  final String paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  Session({
    required this.id,
    required this.service,
    required this.nurse,
    required this.client,
    required this.code,
    required this.status,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['_id'],
      service: json['service'],
      nurse: json['nurse'],
      client: json['client'],
      code: json['code'],
      status: json['status'],
      paymentStatus: json['paymentStatus'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'service': service,
      'nurse': nurse,
      'client': client,
      'code': code,
      'status': status,
      'paymentStatus': paymentStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
