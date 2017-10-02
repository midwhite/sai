<template>
  <div class="new-comment">
    <form @submit="onSubmit">
      <p class="lets-comment">この政策についてコメントしてみよう</p>
      <div class="btn-area">
        <strong class="strong">{{parties[topic.target_id]}}</strong>
        <span>の</span>
        <strong class="strong">{{topic.policy}}</strong>
        <span>について</span>
        <select name="comment[position]" class="input-sm">
          <option v-for="(position, i) of positions" :value="i">{{position}}</option>
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
  import { PARTY_PARAMS, POSITION_PARAMS } from '../../constants';

  export default {
    props: ["topic", "replyTo"],
    computed: {
      parties(){ return PARTY_PARAMS; },
      positions(){ return POSITION_PARAMS }
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
  .lets-comment {
    margin: 8px 0px 0px;
    color: #666;
    text-align: right;
  }
  .btn-area {
    padding: 8px 0px;
    text-align: right;
  }
</style>