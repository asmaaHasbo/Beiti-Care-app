class WithdrawHistoryItem {
  final String phoneNumber;
  final String amount;
  final String date;
  final bool isComplete;

  const WithdrawHistoryItem({
    required this.phoneNumber,
    required this.amount,
    required this.date,
    required this.isComplete,
  });

  factory WithdrawHistoryItem.fromJson(Map<String, dynamic> json) {
    return WithdrawHistoryItem(
      phoneNumber: json['phoneNumber'] as String,
      amount: json['amount'] as String,
      date: json['date'] as String,
      isComplete: json['isComplete'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'amount': amount,
      'date': date,
      'isComplete': isComplete,
    };
  }
}
