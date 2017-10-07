/* eslint no-console:0 */

import Vue       from 'vue';
import Vuex      from 'vuex';
import VueRouter from 'vue-router';

import store  from './store';
import routes from './routes';
import App    from './app';

Vue.use(Vuex);
Vue.use(VueRouter);

import './assets/css/application';

window.addEventListener("DOMContentLoaded", ()=>{
  new Vue({
    el: "#application",
    store: new Vuex.Store(store),
    router: new VueRouter(routes),
    render: (h) => h(App)
  });
});