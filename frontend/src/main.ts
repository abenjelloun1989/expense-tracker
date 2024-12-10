import { createApp } from 'vue';
import App from './App.vue';
import AddExpenseForm from './components/AddExpenseForm.vue';
import CategoryBudget from './components/CategoryBudget.vue';
import './assets/main.css';

const app = createApp(App);

// Register components globally (optional)
app.component('AddExpenseForm', AddExpenseForm);
app.component('CategoryBudget', CategoryBudget);

// Mount the app
app.mount('#app');
