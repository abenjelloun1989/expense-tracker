import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Transactions from '../views/Transactions.vue';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/transactions/:budgetName',
    name: 'Transactions',
    component: Transactions,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
