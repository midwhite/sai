import axios from './axios';

export default {
  getCurrentUser(context){
    axios.get("/users/me").then(({data}) => {
      context.commit("setCurrentUser", { currentUser: data.user });
    });
  },
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
        context.commit("addTopicReputation", {
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
        context.commit("addTopicReputation", {
          id: topicId,
          type: "bad",
          topic: data.topic
        });
      });
    }
  },
  getComments(context, params){
    axios.get(`/topics/${params.topicId}/comments`).then(({data}) => {
      context.commit("setComments", data.comments);
    });
  },
  postComment(context, params){
    const topicId = params.get("comment[topic_id]");
    axios.post(`/topics/${topicId}/comments`, params).then(({data}) => {
      context.commit("addComments", [data.comment]);
    });
  }
}