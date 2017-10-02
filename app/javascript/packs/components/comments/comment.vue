<template>
  <div class="comment-component">
    <div class="btn-area">
      <strong>{{party}}</strong>
      <span>の</span>
      <strong>{{topic.policy}}</strong>
      <span>について</span>
      <strong>{{position}}</strong>
    </div>
    <div class="content">
      <p v-for="sentense of comment.content.split(/\n|\r|\r\n/)">{{sentense}}</p>
    </div>
  </div>
</template>

<script>
  import { PARTY_PARAMS, POSITION_PARAMS } from '../../constants';

  export default {
    props: ["topic", "comment"],
    computed: {
      party(){ return PARTY_PARAMS[this.topic.target_id]; },
      position(){ return POSITION_PARAMS[this.comment.position]; }
    }
  }
</script>

<style scoped>
  .comment-component {
    padding: 10px;
    border-bottom: 1px solid #CCC;
    background: #EEE;
  }
  .content p {
    margin: 0px;
  }
</style>