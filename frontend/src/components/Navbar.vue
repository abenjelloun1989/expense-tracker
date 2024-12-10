<template>
    <div class="fixed top-0 left-0 right-0 bg-white p-4 shadow-md flex justify-between items-center z-10">
      <h1 class="text-xl font-semibold">Expense Tracker</h1>
      <button
        @click="toggleModal"
        class="w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center shadow-lg">
        <span class="text-2xl">+</span>
      </button>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  
  const toggleModal = () => {
    console.log('Toggle modal to add expense or budget');
  };
  </script>
  
  <style scoped>
  button {
    position: fixed;
    bottom: 20px;
    right: 20px;
  }
  </style>
  