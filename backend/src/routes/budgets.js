const express = require('express');
const router = express.Router();
const { getAllBudgets, createBudget } = require('../models/budgetModel');

router.get('/', async (req, res) => {
  const budgets = await getAllBudgets();
  res.json(budgets);
});

router.post('/', async (req, res) => {
  const { name, monthly_limit, currency } = req.body;
  const budget = await createBudget(name, monthly_limit, currency);
  res.json(budget);
});

module.exports = router;
