<template>
  <div>
    <h1>Expense Tracker</h1>
    <form @submit.prevent="addExpense">
      <input v-model="expense.name" placeholder="Expense Name" required />
      <input v-model="expense.category" placeholder="Category" required />
      <input v-model="expense.amount" type="number" placeholder="Amount" required />
      <input v-model="expense.date" type="date" required />
      <button type="submit">Add Expense</button>
    </form>

    <h2>Expenses</h2>
    <ul>
      <li v-for="expense in expenses" :key="expense.id">
        {{ expense.name }} - {{ expense.category }} - {{ expense.amount }} - {{ expense.date }}
      </li>
    </ul>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import axios from 'axios';

export default defineComponent({
  data() {
    return {
      expense: {
        name: '',
        category: '',
        amount: 0,
        date: '',
      },
      expenses: [] as Array<{ id: number; name: string; category: string; amount: number; date: string }>,
    };
  },
  mounted() {
    this.fetchExpenses();
  },
  methods: {
    async fetchExpenses() {
      try {
        const response = await axios.get('http://localhost:5000/expenses');
        this.expenses = response.data;
      } catch (error) {
        console.error('Error fetching expenses:', error);
      }
    },
    async addExpense() {
      try {
        const response = await axios.post('http://localhost:5000/expenses', this.expense);
        this.expenses.push(response.data);
        this.expense.name = '';
        this.expense.category = '';
        this.expense.amount = 0;
        this.expense.date = '';
      } catch (error) {
        console.error('Error adding expense:', error);
      }
    }
  }
});
</script>

<style>
/* Add your styles here */
</style>
