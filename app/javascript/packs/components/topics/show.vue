<template>
  <div id="showTopic">
    <div class="btn-area">
      <a class="return-link" @click="goBack">>> 戻る</a>
    </div>
    <Topic v-if="topic" :topic="topic" :initiallyOpenComments="true" />
    <div v-else>
      <p class="no-topic-error">お探しのトピックが見つかりません。削除された可能性があります。</p>
    </div>
  </div>
</template>

<script>
  import { mapState, mapActions } from 'vuex';
  import Topic from './topic';

  export default {
    components: {
      Topic
    },
    computed: {
      ...mapState(["topics"]),
      topic(){
        const topicId = parseInt(this.$route.params.id);
        return this.topics.filter(topic => { return topic.id === topicId; })[0];
      }
    },
    methods: {
      ...mapActions(["getTopics"]),
      goBack(e){
        e.preventDefault();
        this.$router.go(-1);
      }
    },
    created(){
      if(this.topics.length === 0){
        this.getTopics();
      }
    }
  }
</script>

<style scoped>
  #showTopic {
    padding-top: 10px;
  }
  .no-topic-error {
    padding: 10px;
    background: #FFF;
  }
  .return-link {
    width: 100px;
    padding: 0px 10px 10px;
    display: block;
  }
</style>