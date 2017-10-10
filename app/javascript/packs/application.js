/* eslint no-console:0 */

import Vue       from 'vue';
import Vuex      from 'vuex';
import VueRouter from 'vue-router';
import VueAnalytics from 'vue-analytics';

import store  from './store';
import routes from './routes';
import App    from './app';

Vue.use(Vuex);
Vue.use(VueRouter);
Vue.use(VueAnalytics, {
  id: "UA-107699832-1"
});

import './assets/css/application';

window.addEventListener("DOMContentLoaded", ()=>{
  new Vue({
    el: "#application",
    store: new Vuex.Store(store),
    router: new VueRouter(routes),
    render: (h) => h(App)
  });
});