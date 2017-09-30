import axios from './axios';

export default {
  getTopics(context){
    axios.get("/topics").then(({data}) => {
      context.commit("addTopic", data.topics);
    });
  },
  postTopic(context, params){
    axios.post("/topics", params).then(({data}) => {
      context.commit("addTopic", [data.topic]);
    });
  }
}