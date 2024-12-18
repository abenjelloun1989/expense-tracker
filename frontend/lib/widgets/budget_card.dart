import 'package:flutter/material.dart';
import '../models/budget.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;
  final double spent;
  final Function() onTap;

  const BudgetCard({Key? key, required this.budget, required this.spent, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percentage = (spent / budget.monthlyLimit).clamp(0, 1);
    return Card(
      child: ListTile(
        title: Text(budget.name),
        subtitle: Text('Limit: ${budget.monthlyLimit} ${budget.currency} | Spent: $spent ${budget.currency}'),
        trailing: Stack(
          children: [
            Container(
              width: 50,
              height: 10,
              color: Colors.grey[200],
            ),
            Container(
              width: 50 * percentage,
              height: 10,
              color: percentage < 0.8 ? Colors.green : Colors.red,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
