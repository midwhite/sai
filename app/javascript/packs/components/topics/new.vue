<template>
  <div id="newTopic">
    <form id="newTopicForm" @submit="onSubmit">
      <div class="btn-area">
        <select name="topic[target_id]" id="new_topic_target_id" class="input-sm">
          <option v-for="(party, i) of parties" :value="i">{{party}}</option>
        </select>
        <span>の</span>
        <select name="topic[policy]" id="new_topic_policy" class="input-sm">
          <option v-for="policy of policies">{{policy}}</option>
        </select>
        <span>に</span>
        <select name="topic[position]" id="new_topic_position" class="input-sm">
          <option value="1">賛成</option>
          <option value="-1">反対</option>
          <option value="0">質問</option>
        </select>
      </div>
      <input type="text" name="topic[title]" id="new_topic_title" class="form-control" placeholder="件名" required />
      <textarea name="topic[content]" rows="6" id="new_topic_content" class="form-control" placeholder="内容" required></textarea>
      <input type="hidden" name="topic[target_type]" value="party" id="new_topic_target_type" />
      <div class="btn-area">
        <input type="submit" class="btn-submit" />
      </div>
    </form>
  </div>
</template>

<script>
  import { mapActions } from 'vuex';
  import { PARTY_PARAMS, POLICY_PARAMS } from '../../constants';

  export default {
    computed: {
      policies(){
        return POLICY_PARAMS;
      },
      parties(){
        return PARTY_PARAMS;
      }
    },
    methods: {
      ...mapActions(["postTopic"]),
      onSubmit(e){
        e.preventDefault();
        this.postTopic(new FormData(e.target));
        e.target.reset();
      }
    }
  }
</script>

<style scoped>
  #newTopic {
    padding: 0px 10px;
    margin: 10px 0px;
    background: #FFF;
  }
  .btn-area {
    text-align: right;
    padding: 8px 0px;
  }
</style>