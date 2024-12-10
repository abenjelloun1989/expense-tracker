import express, { Request, Response } from 'express';
import cors from 'cors';
import { Pool } from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const app = express();

// Setup PostgreSQL connection
const pool = new Pool({
  user: process.env.DB_USER,
  host: 'db', // Docker service name for PostgreSQL
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: 5432,
});

app.use(cors());
app.use(express.json());

// Root route
app.get('/', (req: Request, res: Response) => {
  res.send('Expense Tracker API');
});

// Get expenses for the current month
app.get('/expenses', async (req: Request, res: Response) => {
  try {
    const result = await pool.query('SELECT * FROM expenses ORDER BY date DESC');
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Database query failed' });
  }
});

// Add a new expense
app.post('/expenses', async (req: Request, res: Response) => {
  const { name, category, amount, date } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO expenses (name, category, amount, date) VALUES ($1, $2, $3, $4) RETURNING *',
      [name, category, amount, date]
    );
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Database insertion failed' });
  }
});

// Get expenses for a given month
app.get('/budget', async (req: Request, res: Response) => {
  try {
    const result = await pool.query('SELECT category, SUM(amount) FROM expenses GROUP BY category');
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error fetching budget data' });
  }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
