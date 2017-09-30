<template>
  <div id="topics">
    <h1>topics#index</h1>
    <NewTopic />
    <ul>
      <li v-for="topic of topics">{{topic.title}}</li>
    </ul>
  </div>
</template>

<script>
  import { mapState, mapActions } from 'vuex';
  import NewTopic from './new';

  export default {
    components: {
      NewTopic
    },
    methods: mapActions(["getTopics"]),
    computed: mapState(["topics"]),
    mounted(){
      this.getTopics();
    }
  }
</script>