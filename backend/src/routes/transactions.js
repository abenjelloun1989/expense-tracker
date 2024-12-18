const express = require('express');
const router = express.Router();
const { getTransactionsByBudget, addTransaction, getMonthlyReport } = require('../models/transactionModel');

router.get('/by-budget/:budgetId/:month/:year', async (req, res) => {
  const { budgetId, month, year } = req.params;
  const transactions = await getTransactionsByBudget(budgetId, month, year);
  res.json(transactions);
});

router.post('/', async (req, res) => {
  const { budgetId, amount, currency, description } = req.body;
  const transaction = await addTransaction(budgetId, amount, currency, description);
  res.json(transaction);
});

router.get('/report/:month/:year', async (req, res) => {
  const { month, year } = req.params;
  const report = await getMonthlyReport(month, year);
  res.json(report);
});

module.exports = router;
