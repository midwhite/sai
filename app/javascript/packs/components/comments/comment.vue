<template>
  <div class="comment-component">
    <div class="btn-area">
      <strong>{{party}}</strong>
      <span>の</span>
      <strong>{{topic.policy}}</strong>
      <span>に</span>
      <strong>{{position}}</strong>
    </div>
    <div class="content">
      <p v-for="sentense of comment.content.split(/\n|\r|\r\n/)">{{sentense}}</p>
    </div>
  </div>
</template>

<script>
  import { PARTY_PARAMS } from '../../constants';

  export default {
    props: ["topic", "comment"],
    computed: {
      party(){ return PARTY_PARAMS[this.topic.position + 1]; },
      position(){
        return ["反対", "質問", "賛成"][this.comment.position + 1];
      }
    }
  }
</script>

<style scoped>
  .comment-component {
    padding: 10px;
    border-radius: 3px;
    background: #EEE;
  }
  .content p {
    margin: 0px;
  }
</style>