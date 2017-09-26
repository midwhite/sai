import Vuex from 'vuex';
import Actions from './action-types';
import Mutations from './mutation-types';

const state = {
  messages: ["Store has loaded."]
};

const getters = {
  firstMessage: state => state.messages[0]
};

const store = {
  state,
  getters,
  Actions,
  Mutations
};

export default store;