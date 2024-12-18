const pool = require('../db');

async function getTransactionsByBudget(budgetId, month, year) {
  const startDate = `${year}-${month}-01`;
  const endDate = `${year}-${month}-31`; 
  const res = await pool.query(
    'SELECT * FROM transactions WHERE budget_id = $1 AND created_at >= $2 AND created_at <= $3 ORDER BY created_at ASC',
    [budgetId, startDate, endDate]
  );
  return res.rows;
}

async function addTransaction(budgetId, amount, currency, description) {
  const res = await pool.query(
    'INSERT INTO transactions (budget_id, amount, currency, description) VALUES ($1, $2, $3, $4) RETURNING *',
    [budgetId, amount, currency, description]
  );
  return res.rows[0];
}

async function getMonthlyReport(month, year) {
  const startDate = `${year}-${month}-01`;
  const endDate = `${year}-${month}-31`; 
  const res = await pool.query(
    `SELECT b.name as budget_name, SUM(t.amount) as total_spent, b.monthly_limit, b.currency, 
            JSON_AGG(JSON_BUILD_OBJECT('id', t.id, 'amount', t.amount, 'currency', t.currency, 'description', t.description, 'date', t.created_at)) as transactions
     FROM budgets b
     LEFT JOIN transactions t ON b.id = t.budget_id AND t.created_at >= $1 AND t.created_at <= $2
     GROUP BY b.id;`,
    [startDate, endDate]
  );
  return res.rows;
}

module.exports = { getTransactionsByBudget, addTransaction, getMonthlyReport };
