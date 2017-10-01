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
  },
  makeGood(context, e){
    const topicId = parseInt(e.target.dataset.topicId);
    if(context.state.goodTopics.indexOf(topicId) === -1){
      axios.post(`/topics/${topicId}/good`).then(({data}) => {
        context.commit("addReputation", {
          id: topicId,
          type: "good",
          topic: data.topic
        });
      });
    }
  },
  makeBad(context, e){
    const topicId = parseInt(e.target.dataset.topicId);
    if(context.state.badTopics.indexOf(topicId) === -1){
      axios.post(`/topics/${topicId}/bad`).then(({data}) => {
        context.commit("addReputation", {
          id: topicId,
          type: "bad",
          topic: data.topic
        });
      });
    }
  }
}