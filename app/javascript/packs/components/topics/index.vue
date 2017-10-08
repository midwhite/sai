<template>
  <div id="topics" class="row">
    <div class="col-sm-12">
      <NewTopic />
      <div class="topics-list">
        <Topic v-for="topic of topics" :topic="topic" />
      </div>
    </div>
  </div>
</template>

<script>
  import { mapState, mapActions } from 'vuex';
  import NewTopic from './new';
  import Topic from './topic';

  export default {
    components: {
      NewTopic,
      Topic
    },
    methods: mapActions(["getTopics"]),
    computed: mapState(["topics"]),
    mounted(){
      if(this.topics.length === 0){
        this.getTopics();
      }
    }
  }
</script>
