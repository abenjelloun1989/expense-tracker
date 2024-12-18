import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/api_service.dart';
import '../models/budget.dart';
import '../pages/budget_detail_page.dart';
import '../pages/add_item_dialogs.dart';
import '../widgets/budget_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Budget> budgets = [];
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  Map<int, double> budgetSpent = {};

  @override
  void initState() {
    super.initState();
    _loadBudgets();
  }

  void _loadBudgets() async {
    var b = await ApiService.fetchBudgets();
    setState(() {
      budgets = b;
    });
    for (var budget in b) {
      var transactions = await ApiService.fetchTransactions(budget.id, month, year);
      double sum = 0;
      for (var t in transactions) {
        sum += t.amount;
      }
      setState(() {
        budgetSpent[budget.id] = sum;
      });
    }
  }

  void _createBudget() async {
    var result = await showDialog(
      context: context,
      builder: (_) => AddBudgetDialog(),
    );
    if (result != null) {
      await ApiService.createBudget(result['name'], result['limit'], result['currency']);
      _loadBudgets();
    }
  }

  void _addTransaction() async {
    var result = await showDialog(
      context: context,
      builder: (_) => AddTransactionDialog(budgets: budgets),
    );
    if (result != null) {
      await ApiService.addTransaction(result['budgetId'], result['amount'], result['currency'], result['description']);
      _loadBudgets();
    }
  }

  void _generateReport() async {
    var report = await ApiService.getReport(month, year);
    // You can display a modal or navigate to a new page with the report info.
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Monthly Report (${DateFormat.yMMMM().format(DateTime(year, month))})'),
        content: SingleChildScrollView(
          child: Text(report.toString()),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker (${DateFormat.yMMMM().format(DateTime(year, month))})'),
      ),
      body: ListView.builder(
        itemCount: budgets.length,
        itemBuilder: (context, index) {
          var b = budgets[index];
          var spent = budgetSpent[b.id] ?? 0.0;
          return BudgetCard(
            budget: b,
            spent: spent,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => BudgetDetailPage(budget: b, month: month, year: year)));
            },
          );
        },
      ),
      floatingActionButton: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'budget') {
            _createBudget();
          } else if (value == 'transaction') {
            _addTransaction();
          } else if (value == 'report') {
            _generateReport();
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'budget',
            child: Text('Add Budget'),
          ),
          PopupMenuItem(
            value: 'transaction',
            child: Text('Add Transaction'),
          ),
          PopupMenuItem(
            value: 'report',
            child: Text('Generate Report'),
          ),
        ],
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Show menu by tapping FAB
        }),
      ),
    );
  }
}
