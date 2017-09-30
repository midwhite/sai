<template>
  <div id="newTopic">
    <form id="newTopicForm" @submit="onSubmit">
      <input type="text" name="topic[title]" id="new_topic_title" class="form-control" placeholder="件名" />
      <textarea name="topic[content]" id="new_topic_content" class="form-control"></textarea>
      <div class="btn-area">
        <input type="submit" class="btn-submit" />
      </div>
    </form>
  </div>
</template>

<script>
  import { mapActions } from 'vuex';

  export default {
    methods: {
      onSubmit(e){
        e.preventDefault();
        this.postTopic(new FormData(e.target));
        e.target.reset();
      },
      ...mapActions(["postTopic"])
    }
  }
</script>

<style scoped>
  .btn-area {
    text-align: right;
    padding: 8px;
  }
  .btn-submit {
    width: 100px;
    padding: 0px;
    border: 1px solid #388E3C;
    border-radius: 3px;
    background: #43A047;
    color: #FFF;
    font-family: system-ui;
    text-align: center;
    line-height: 1.7em;
  }
</style>