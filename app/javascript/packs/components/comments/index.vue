<template>
  <div clas="comment-component">
    <NewComment :topic="topic" />
    <Comment v-for="comment of topic.comments" :topic="topic" :comment="comment" />
  </div>
</template>

<script>
  import { mapActions } from 'vuex';
  import { PARTY_PARAMS } from '../../constants';
  import NewComment from './new';
  import Comment from './comment';

  export default {
    props: ["topic"],
    computed: {
      parties(){ return PARTY_PARAMS; },
      position(){
        return ["反対", "質問", "賛成"][this.topic.position + 1];
      },
    },
    components: {
      NewComment,
      Comment
    },
    methods: mapActions(["getComments"]),
    mounted(){
      this.getComments({
        id: this.topic.id
      });
    }
  }
</script>