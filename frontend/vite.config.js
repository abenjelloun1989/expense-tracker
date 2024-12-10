import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],  // Add the Vue plugin here
  server: {
    host: '0.0.0.0',  // Ensure Vite binds to all network interfaces
    port: 5173,
  },
});
