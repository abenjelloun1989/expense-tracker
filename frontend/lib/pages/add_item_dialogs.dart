import 'package:flutter/material.dart';
import '../models/budget.dart';

class AddBudgetDialog extends StatefulWidget {
  @override
  State<AddBudgetDialog> createState() => _AddBudgetDialogState();
}

class _AddBudgetDialogState extends State<AddBudgetDialog> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _limitController = TextEditingController();
  TextEditingController _currencyController = TextEditingController(text: 'USD');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Budget'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: _limitController, decoration: InputDecoration(labelText: 'Monthly Limit'), keyboardType: TextInputType.number),
          TextField(controller: _currencyController, decoration: InputDecoration(labelText: 'Currency')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, {
              'name': _nameController.text,
              'limit': double.parse(_limitController.text),
              'currency': _currencyController.text
            });
          },
          child: Text('Add')
        )
      ],
    );
  }
}

class AddTransactionDialog extends StatefulWidget {
  final List<Budget> budgets;
  AddTransactionDialog({required this.budgets});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  Budget? selectedBudget;
  TextEditingController _amountController = TextEditingController();
  TextEditingController _currencyController = TextEditingController(text: 'USD');
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Transaction'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<Budget>(
              hint: Text('Select Budget'),
              items: widget.budgets.map((b) =>
                  DropdownMenuItem(value: b, child: Text(b.name))
              ).toList(),
              onChanged: (val) {
                setState(() {
                  selectedBudget = val;
                });
              },
            ),
            TextField(controller: _amountController, decoration: InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
            TextField(controller: _currencyController, decoration: InputDecoration(labelText: 'Currency')),
            TextField(controller: _descriptionController, decoration: InputDecoration(labelText: 'Description')),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        ElevatedButton(
          onPressed: selectedBudget == null ? null : () {
            Navigator.pop(context, {
              'budgetId': selectedBudget!.id,
              'amount': double.parse(_amountController.text),
              'currency': _currencyController.text,
              'description': _descriptionController.text
            });
          },
          child: Text('Add')
        )
      ],
    );
  }
}
