<template>
  <div id="topics" class="row">
    <div class="col-sm-12">
      <NewTopic />
      <SortPanel />
      <div class="topics-list">
        <p class="topics-length">表示: {{filteredTopics.length}}件 / {{topics.length}}件</p>
        <Topic v-for="topic of filteredTopics" :topic="topic" />
      </div>
    </div>
  </div>
</template>

<script>
  import { mapState, mapGetters, mapActions } from 'vuex';
  import NewTopic from './new';
  import Topic from './topic';
  import SortPanel from './sort_panel';

  export default {
    components: {
      NewTopic,
      Topic,
      SortPanel
    },
    methods: mapActions(["getTopics"]),
    computed: {
      ...mapGetters(["filteredTopics"]),
      ...mapState(["topics"])
    },
    mounted(){
      if(this.topics.length === 0){
        this.getTopics();
      }
    }
  }
</script>

<style scoped>
  .topics-length {
    text-align: center;
    font-weight: bold;
  }
</style>