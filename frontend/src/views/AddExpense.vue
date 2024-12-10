<template>
    <div class="px-4 py-8 max-w-md mx-auto">
        <h2 class="text-xl font-semibold mb-4">Add Expense</h2>
        <form @submit.prevent="submitForm">
        <div class="mb-4">
            <label for="expense-name" class="block text-sm font-medium">Expense Name</label>
            <input
            v-model="expense.name"
            id="expense-name"
            type="text"
            class="mt-1 p-2 border rounded-md w-full"
            placeholder="Enter name of expense" required />
        </div>
        <div class="mb-4">
            <label for="amount" class="block text-sm font-medium">Amount (€)</label>
            <input
            v-model="expense.amount"
            id="amount"
            type="number"
            step="0.01"
            class="mt-1 p-2 border rounded-md w-full"
            placeholder="Amount in Euros" required />
        </div>
        <div class="mb-4">
            <label for="date" class="block text-sm font-medium">Date</label>
            <input
            v-model="expense.date"
            id="date"
            type="date"
            class="mt-1 p-2 border rounded-md w-full"
            required />
        </div>
        <div class="mb-4">
            <label for="category" class="block text-sm font-medium">Category</label>
            <select
            v-model="expense.category"
            id="category"
            class="mt-1 p-2 border rounded-md w-full">
            <option v-for="budget in budgets" :key="budget.id" :value="budget.name">{{ budget.name }}</option>
            </select>
        </div>
        <button type="submit" class="w-full bg-blue-600 text-white p-2 rounded-md">Add Expense</button>
        </form>
    </div>
    </template>

    <script setup>
    import { ref } from 'vue';

    const expense = ref({
    name: '',
    amount: 0,
    date: '',
    category: ''
    });

    const budgets = ref([
    { id: 1, name: 'Food' },
    { id: 2, name: 'Transport' },
    { id: 3, name: 'Entertainment' }
    ]);

    const submitForm = () => {
    console.log('Submit expense', expense.value);
    };
    </script>
