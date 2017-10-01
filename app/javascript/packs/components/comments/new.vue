<template>
  <div class="new-comment">
    <form @submit="onSubmit">
      <div class="btn-area">
        <strong class="strong">{{parties[topic.target_id]}}</strong>
        <span>の</span>
        <strong class="strong">{{topic.policy}}</strong>
        <span>に</span>
        <select name="comment[position]" class="input-sm">
          <option value="1">賛成</option>
          <option value="0">反対</option>
          <option value="-1">質問</option>
        </select>
      </div>
      <textarea name="content" rows="4" :data-topic-id="topic.id" class="form-control" placeholder="コメント"></textarea>
      <input v-if="replyTo" type="hidden" name="reply_to" :value="replyTo" />
      <div class="btn-area">
        <input type="submit" class="btn-submit" />
      </div>
    </form>
  </div>
</template>

<script>
  import { PARTY_PARAMS } from '../../constants';

  export default {
    props: ["topic", "replyTo"],
    computed: {
      parties(){ return PARTY_PARAMS; }
    },
    methods: {
      onSubmit(e){
        e.preventDefault();
        console.log(e, e.target.dataset.topicId);
      }
    }
  }
</script>

<style scoped>
  .btn-area {
    padding: 8px 0px;
    text-align: right;
  }
</style>