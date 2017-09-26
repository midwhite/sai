/* eslint no-console:0 */

import Vue from 'vue';
import Vuex from 'vuex';
import Store from './store';

import App from './app';

Vue.use(Vuex);

const store = new Vuex.Store(Store);

window.addEventListener("DOMContentLoaded", ()=>{
  const vm = new Vue({
    el: "#application",
    store,
    render (h) { return h(App); }
  });
});