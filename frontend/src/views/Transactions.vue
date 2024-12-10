<template>
    <div class="p-4">
      <h1 class="text-xl font-bold mb-4">Transactions for {{ budgetName }}</h1>
      <ul>
        <li
          v-for="transaction in transactions"
          :key="transaction.id"
          class="mb-2 bg-gray-100 rounded p-2">
          <p class="text-sm font-medium">{{ transaction.name }}</p>
          <p class="text-sm text-gray-600">€{{ transaction.amount }} on {{ transaction.date }}</p>
        </li>
      </ul>
    </div>
  </template>
  
  <script setup>
  import { useRoute } from 'vue-router';
  
  const route = useRoute();
  const budgetName = route.params.budgetName;
  
  const transactions = [
    { id: 1, name: 'Milk', amount: 2.5, date: '2024-12-01', budget: 'Groceries' },
    { id: 2, name: 'Movie', amount: 12, date: '2024-12-02', budget: 'Entertainment' },
    { id: 3, name: 'Bread', amount: 1.2, date: '2024-12-03', budget: 'Groceries' },
  ].filter((transaction) => transaction.budget === budgetName);
  </script>
  