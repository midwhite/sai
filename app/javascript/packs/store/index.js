import actions from './action-types';
import mutations from './mutation-types';

const state = {
  currentUser: {},
  notifications: [],
  topics: [],
  goodTopics: [],
  badTopics: [],
  filterTopics: {
    sort: "newer",
    policy: "",
    party: "",
    position: ""
  }
};

const getters = {
  filteredTopics(state){
    let topics = state.topics.filter(topic => {
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
    return topics.sort((n1, n2) => {
      switch(state.filterTopics.sort){
        case "newer":
          return n1.id > n2.id ? -1 : 1;
        case "good":
          return n1.good > n2.good ? -1 : 1;
        case "bad":
          return n1.bad > n2.bad ? -1 : 1;
        default:
          break;
      }
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