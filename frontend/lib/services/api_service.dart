import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/budget.dart';
import '../models/transaction.dart';

class ApiService {
  static const baseUrl = 'http://localhost:3000/api'; // Adjust if running on different host

  static Future<List<Budget>> fetchBudgets() async {
    final res = await http.get(Uri.parse('$baseUrl/budgets'));
    if (res.statusCode == 200) {
      List data = json.decode(res.body);
      return data.map((b) => Budget.fromJson(b)).toList();
    }
    throw Exception("Failed to load budgets");
  }

  static Future<Budget> createBudget(String name, double limit, String currency) async {
    final res = await http.post(
      Uri.parse('$baseUrl/budgets'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'monthly_limit': limit.toString(),
        'currency': currency
      })
    );
    if (res.statusCode == 200) {
      return Budget.fromJson(json.decode(res.body));
    }
    throw Exception("Failed to create budget");
  }

  static Future<List<TransactionModel>> fetchTransactions(int budgetId, int month, int year) async {
    final res = await http.get(Uri.parse('$baseUrl/transactions/by-budget/$budgetId/$month/$year'));
    if (res.statusCode == 200) {
      List data = json.decode(res.body);
      return data.map((t) => TransactionModel.fromJson(t)).toList();
    }
    throw Exception("Failed to load transactions");
  }

  static Future<TransactionModel> addTransaction(int budgetId, double amount, String currency, String description) async {
    final res = await http.post(
      Uri.parse('$baseUrl/transactions'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'budgetId': budgetId,
        'amount': amount.toString(),
        'currency': currency,
        'description': description
      })
    );
    if (res.statusCode == 200) {
      return TransactionModel.fromJson(json.decode(res.body));
    }
    throw Exception("Failed to add transaction");
  }

  static Future<dynamic> getReport(int month, int year) async {
    final res = await http.get(Uri.parse('$baseUrl/transactions/report/$month/$year'));
    if (res.statusCode == 200) {
      return json.decode(res.body);
    }
    throw Exception("Failed to get report");
  }
}
