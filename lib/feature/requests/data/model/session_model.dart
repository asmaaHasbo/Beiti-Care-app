class SessionsResponse {
  final bool success;
  final SessionStatus confirmed;
  final SessionStatus pending;
  final SessionStatus canceled;
  final SessionStatus completed;

  SessionsResponse({
    required this.success,
    required this.confirmed,
    required this.pending,
    required this.canceled,
    required this.completed,
  });

  factory SessionsResponse.fromJson(Map<String, dynamic> json) {
    return SessionsResponse(
      success: json['success'] as bool,
      confirmed: SessionStatus.fromJson(json['confirmed']),
      pending: SessionStatus.fromJson(json['pending']),
      canceled: SessionStatus.fromJson(json['canceled']),
      completed: SessionStatus.fromJson(json['completed']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'confirmed': confirmed.toJson(),
      'pending': pending.toJson(),
      'canceled': canceled.toJson(),
      'completed': completed.toJson(),
    };
  }
}

class SessionStatus {
  final int count;
  final List<Session> sessions;

  SessionStatus({
    required this.count,
    required this.sessions,
  });

  factory SessionStatus.fromJson(Map<String, dynamic> json) {
    return SessionStatus(
      count: json['count'] as int,
      sessions: (json['sessions'] as List)
          .map((session) => Session.fromJson(session))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'sessions': sessions.map((session) => session.toJson()).toList(),
    };
  }
}

class Session {
  final String id;
  final String service;
  final String client;
  final String? code;
  final String ?status;
  final DateTime createdAt;

  Session({
    required this.id,
    required this.service,
    required this.client,
     this.code,
     this.status,
    required this.createdAt,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['sessionId'] as String,
      service: json['serviceName'] as String,
      client: json['patientName'] as String,
      code:json['code'] ,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'service': service,
      'client': client,
      'code': code,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}