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
    <p class="post-time">{{comment.created_at}}</p>
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
    border: solid #CCC;
    border-width: 0px 1px 1px;
    background: #EEE;
  }
  .content p {
    margin: 0px;
  }
  .post-time {
    margin: 5px 5px 0px;
    text-align: right;
  }
</style>