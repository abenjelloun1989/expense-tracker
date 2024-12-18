require('dotenv').config();

module.exports = {
  db: {
    host: process.env.DB_HOST || 'db',
    user: process.env.DB_USER || 'postgres',
    password: process.env.DB_PASSWORD || 'postgres',
    database: process.env.DB_NAME || 'expense_tracker',
    port: 5432
  },
  port: process.env.PORT || 3000
};
