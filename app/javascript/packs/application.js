/* eslint no-console:0 */

import Vue from 'vue';
import Vuex from 'vuex';
import Store from './store';

Vue.use(Vuex);

const store = new Vuex.Store(Store);

const vm = new Vue({
  el: "#application",
  store
});