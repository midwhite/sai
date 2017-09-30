export default {
  addTopic: (state, topics) => {
    state.topics.unshift(...topics);
  }
}