import 'package:flutter/material.dart';
import '../models/budget.dart';
import '../models/transaction.dart';
import '../services/api_service.dart';

class BudgetDetailPage extends StatefulWidget {
  final Budget budget;
  final int month;
  final int year;

  const BudgetDetailPage({Key? key, required this.budget, required this.month, required this.year}) : super(key: key);

  @override
  State<BudgetDetailPage> createState() => _BudgetDetailPageState();
}

class _BudgetDetailPageState extends State<BudgetDetailPage> {
  List<TransactionModel> transactions = [];

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  void _loadTransactions() async {
    transactions = await ApiService.fetchTransactions(widget.budget.id, widget.month, widget.year);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double totalSpent = transactions.fold(0.0, (sum, t) => sum + t.amount);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.budget.name),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Monthly Limit: ${widget.budget.monthlyLimit} ${widget.budget.currency}'),
            subtitle: Text('Spent: $totalSpent ${widget.budget.currency}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (_, i) {
                var t = transactions[i];
                return ListTile(
                  title: Text('${t.amount} ${t.currency}'),
                  subtitle: Text(t.description),
                  trailing: Text(t.createdAt.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
