<template>
    <div class="w-full max-w-sm mx-auto bg-white p-6 rounded-md shadow-md">
      <h2 class="text-xl font-semibold mb-4">Add Expense</h2>
      <form @submit.prevent="addExpense" class="space-y-4">
        <input
          v-model="expense.name"
          placeholder="Expense Name"
          required
          class="w-full p-2 border border-gray-300 rounded-md"
        />
        <input
          v-model="expense.amount"
          type="number"
          placeholder="Amount"
          required
          class="w-full p-2 border border-gray-300 rounded-md"
        />
        <select
          v-model="expense.category"
          required
          class="w-full p-2 border border-gray-300 rounded-md"
        >
          <option value="" disabled selected>Select Category</option>
          <option v-for="category in categories" :key="category" :value="category">{{ category }}</option>
        </select>
        <button
          type="submit"
          class="w-full p-2 bg-blue-500 text-white rounded-md hover:bg-blue-600"
        >
          Add Expense
        </button>
      </form>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref } from 'vue';
  
  export default defineComponent({
    name: 'AddExpenseForm',
    props: {
      categories: {
        type: Array as () => string[],
        required: true,
      },
      onAddExpense: {
        type: Function as () => (expense: { name: string; amount: number; category: string }) => void,
        required: true,
      },
    },
    setup(props) {
      const expense = ref({
        name: '',
        amount: 0,
        category: '',
      });
  
      const addExpense = () => {
        if (expense.value.name && expense.value.amount > 0 && expense.value.category) {
          props.onAddExpense(expense.value); // Trigger the parent handler to add the expense
          expense.value = { name: '', amount: 0, category: '' }; // Reset the form
        }
      };
  
      return {
        expense,
        addExpense,
      };
    },
  });
  </script>
  
  <style scoped>
  /* You can add scoped styles here if necessary */
  </style>
  