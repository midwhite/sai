export default {
  addTopic(state, topics){
    state.topics.unshift(...topics);
  },
  addReputation(state, params){
    // 既に評価済みのTopicIDを管理
    switch(params.type){
      case "good":
        if(state.goodTopics.indexOf(params.id) === -1){
          state.goodTopics.push(params.id);
        }
        break;
      case "bad":
        if(state.badTopics.indexOf(params.id) === -1){
          state.badTopics.push(params.id);
        }
        break;
    }
    // Topicの評価を更新
    state.topics = state.topics.map(topic => {
      return (topic.id === params.id) ? params.topic : topic;
    });
  }
}