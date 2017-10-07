import actions from './action-types';
import mutations from './mutation-types';

const state = {
  currentUser: {},
  notifications: [],
  topics: [],
  goodTopics: [],
  badTopics: []
};

const getters = {};

const store = {
  state,
  getters,
  actions,
  mutations
};

export default store;