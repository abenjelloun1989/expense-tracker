<template>
    <div class="p-4">
      <h1 class="text-xl font-bold mb-4">Budgets</h1>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <BudgetCard
          v-for="budget in budgets"
          :key="budget.id"
          :budget="budget"
        />
      </div>
    </div>
  </template>
  
  <script setup>
  import BudgetCard from '../components/BudgetCard.vue';
  
  const budgets = [
    { id: 1, name: 'Groceries', spent: 200, total: 500 },
    { id: 2, name: 'Entertainment', spent: 100, total: 300 },
  ];
  </script>
  