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
          <option value="-1">反対</option>
          <option value="0">質問</option>
        </select>
      </div>
      <textarea name="comment[content]" rows="4" class="form-control" placeholder="コメント" required></textarea>
      <input type="hidden" name="comment[topic_id]" :value="topic.id" />
      <input type="hidden" name="comment[reply_to]" :value="replyTo" v-if="replyTo" />
      <div class="btn-area">
        <input type="submit" class="btn-submit" />
      </div>
    </form>
  </div>
</template>

<script>
  import { mapActions } from 'vuex';
  import { PARTY_PARAMS } from '../../constants';

  export default {
    props: ["topic", "replyTo"],
    computed: {
      parties(){ return PARTY_PARAMS; }
    },
    methods: {
      ...mapActions(["postComment"]),
      onSubmit(e){
        e.preventDefault();
        this.postComment(new FormData(e.target));
        e.target.reset();
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