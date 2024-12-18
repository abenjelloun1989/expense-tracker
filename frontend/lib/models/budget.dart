class Budget {
  final int id;
  final String name;
  final double monthlyLimit;
  final String currency;

  Budget({required this.id, required this.name, required this.monthlyLimit, required this.currency});

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'],
      name: json['name'],
      monthlyLimit: double.parse(json['monthly_limit']),
      currency: json['currency'],
    );
  }
}
