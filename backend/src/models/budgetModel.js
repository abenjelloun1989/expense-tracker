const pool = require('../db');

async function getAllBudgets() {
  const res = await pool.query('SELECT * FROM budgets');
  return res.rows;
}

async function createBudget(name, monthly_limit, currency) {
  const res = await pool.query(
    'INSERT INTO budgets (name, monthly_limit, currency) VALUES ($1, $2, $3) RETURNING *',
    [name, monthly_limit, currency]
  );
  return res.rows[0];
}

module.exports = { getAllBudgets, createBudget };
