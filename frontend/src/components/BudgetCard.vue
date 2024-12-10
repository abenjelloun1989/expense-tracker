<template>
    <div class="bg-white rounded-lg shadow-md p-4">
      <h3 class="text-lg font-semibold">{{ budget.name }}</h3>
      <div class="my-2">
        <div class="h-2 bg-gray-200 rounded-full">
          <div
            class="h-full bg-green-500"
            :style="{ width: (budget.spent / budget.total) * 100 + '%' }"></div>
        </div>
        <p class="text-sm text-gray-600 mt-1">€{{ budget.spent }} / €{{ budget.total }}</p>
      </div>
      <button
        @click="navigateToTransactions(budget)"
        class="text-blue-600 mt-2 text-sm">View Transactions</button>
    </div>
  </template>
  
  <script setup>
  import { useRouter } from 'vue-router';
  
  // Define props
  defineProps({
    budget: {
      type: Object,
      required: true,
    },
  });
  
  const router = useRouter();
  
  const navigateToTransactions = (budget) => {
    router.push(`/transactions/${budget.name}`);
  };
  </script>
  