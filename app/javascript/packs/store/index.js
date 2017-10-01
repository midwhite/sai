import actions from './action-types';
import mutations from './mutation-types';

const state = {
  topics: [],
  notifications: [],
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