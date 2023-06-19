import { createRouter, createWebHistory } from 'vue-router'
import SetoresView from '../views/SetoresView.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'setores',
      component: SetoresView
    },
  ]
})

export default router
