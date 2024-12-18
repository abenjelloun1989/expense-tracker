const express = require('express');
const cors = require('cors');
const config = require('./config');

const app = express();
app.use(cors());
app.use(express.json());

const budgetRoutes = require('./routes/budgets');
const transactionRoutes = require('./routes/transactions');

app.use('/api/budgets', budgetRoutes);
app.use('/api/transactions', transactionRoutes);

app.listen(config.port, () => {
  console.log(`Backend running on port ${config.port}`);
});
