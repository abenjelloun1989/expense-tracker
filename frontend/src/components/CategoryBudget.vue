<template>
    <div class="max-w-md mx-auto p-6 bg-white rounded-lg shadow-lg mt-6">
      <h2 class="text-2xl font-semibold text-center text-blue-600">Set Category Budget</h2>
      <form @submit.prevent="saveBudget" class="mt-6 space-y-4">
        <div v-for="category in categories" :key="category.name">
          <label :for="category.name" class="block text-gray-700 font-medium">{{ category.name }}</label>
          <input
            v-model="category.budget"
            type="number"
            class="w-full p-3 border border-gray-300 rounded-md"
            :placeholder="`Set budget for ${category.name}`"
            required
          />
        </div>
        <button
          type="submit"
          class="w-full bg-green-600 text-white py-3 rounded-md hover:bg-green-700 transition duration-200"
        >
          Save Budget
        </button>
      </form>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  
  // List of categories to set budgets for
  const categories = ref([
    { name: 'Food', budget: '' },
    { name: 'Transport', budget: '' },
    { name: 'Entertainment', budget: '' },
  ]);
  
  // Method to save category budgets (you can later call an API)
  const saveBudget = () => {
    console.log('Category budgets saved:', categories.value);
    // Add your logic to save category budgets (e.g., API call)
  };
  </script>
  
  <style scoped>
  /* Optional: add custom styles for the budget setting form */
  </style>
  