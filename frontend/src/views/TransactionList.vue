<!-- src/views/TransactionList.vue -->
<template>
    <div class="px-4 py-8">
      <h2 class="text-xl font-semibold mb-4">{{ budgetName }} Transactions</h2>
      <ul class="space-y-4">
        <li v-for="transaction in transactions" :key="transaction.id" class="border rounded-md p-4">
          <p><strong>{{ transaction.name }}</strong></p>
          <p class="text-sm text-gray-500">€{{ transaction.amount }} - {{ transaction.date }}</p>
        </li>
      </ul>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { useRoute } from 'vue-router';
  
  const route = useRoute();
  const budgetName = route.params.budgetName;
  
  // Dummy data; replace with your backend API call or state
  const transactions = ref([]);
  
  onMounted(() => {
    // Simulate fetching transactions for the budget
    transactions.value = [
      { id: 1, name: 'Groceries', amount: 50, date: '2024-12-01' },
      { id: 2, name: 'Dining Out', amount: 30, date: '2024-12-03' },
    ];
  });
  </script>
  
  <style scoped>
  /* Add additional styles as needed */
  </style>
  