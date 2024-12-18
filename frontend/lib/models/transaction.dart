class TransactionModel {
  final int id;
  final int budgetId;
  final double amount;
  final String currency;
  final String description;
  final DateTime createdAt;

  TransactionModel({
    required this.id,
    required this.budgetId,
    required this.amount,
    required this.currency,
    required this.description,
    required this.createdAt
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      budgetId: json['budget_id'],
      amount: double.parse(json['amount']),
      currency: json['currency'],
      description: json['description'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
