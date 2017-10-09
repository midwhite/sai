import actions from './action-types';
import mutations from './mutation-types';

const state = {
  currentUser: {},
  notifications: [],
  topics: [],
  goodTopics: [],
  badTopics: [],
  sortTopics: "newer",
  filterTopics: {
    policy: "",
    party: "",
    position: ""
  }
};

const getters = {
  filteredTopics(state){
    return state.topics.filter(topic => {
      if(state.filterTopics.policy !== "" && state.filterTopics.policy !== topic.policy){
        return false;
      }
      if(state.filterTopics.party !== "" && state.filterTopics.party !== topic.target_id){
        return false;
      }
      if(state.filterTopics.position !== "" && state.filterTopics.position !== topic.position){
        return false;
      }
      return true;
    });
  }
};

const store = {
  state,
  getters,
  actions,
  mutations
};

export default store;