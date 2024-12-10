<template>
  <div class="container mx-auto p-6">
    <h1 class="text-4xl font-bold text-center mb-6">Expense Tracker</h1>
    <AddExpenseForm
      :categories="categories"
      :onAddExpense="addExpense"
    />
    <div class="mt-8">
      <h2 class="text-2xl font-semibold mb-4">Expenses</h2>
      <ul class="space-y-4">
        <li
          v-for="expense in expenses"
          :key="expense.name"
          class="p-4 border rounded-md shadow-md"
        >
          <h3 class="text-xl">{{ expense.name }}</h3>
          <p>Amount: ${{ expense.amount }}</p>
          <p>Category: {{ expense.category }}</p>
        </li>
      </ul>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue';
import AddExpenseForm from './components/AddExpenseForm.vue';

export default defineComponent({
  name: 'App',
  components: {
    AddExpenseForm,
  },
  setup() {
    const categories = ref(['Food', 'Transport', 'Entertainment', 'Utilities']);
    const expenses = ref<{ name: string; amount: number; category: string }[]>([]);

    const addExpense = (expense: { name: string; amount: number; category: string }) => {
      expenses.value.push(expense); // Add the expense to the list
    };

    return {
      categories,
      expenses,
      addExpense,
    };
  },
});
</script>

<style>
/* Add global styles here */
body {
  font-family: 'Arial', sans-serif;
  background-color: #f7f7f7;
}
</style>
