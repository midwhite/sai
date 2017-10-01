<template>
  <div class="topic">
    <div class="topic-tags">
      <strong>{{parties[topic.target_id]}}</strong>
      <span>の</span>
      <strong>{{topic.policy}}</strong>
      <span>に</span>
      <strong class="strong">{{position}}</strong>
    </div>
    <h3>{{topic.title}}</h3>
    <div class="description">
      <div v-if="openContent" class="open-content">
        <p v-for="sentense of topic.content.split(/\n|\r|\r\n/)">{{sentense}}</p>
      </div>
      <div v-else>
        {{topic.content.substr(0,100)}}
        <span v-if="topic.content.length >= 100 && !openContent">...</span>
        <div v-if="topic.content.length >= 100 && !this.openContent" class="open-content-btn" @click="toggleContent">>> 全文を見る</div>
      </div>
    </div>
    <div class="topic-operation">
      <div class="operation-panel" :data-topic-id="topic.id" @click="makeGood">Good x{{topic.good}}</div>
      <div class="operation-panel" :data-topic-id="topic.id" @click="makeBad">Bad x{{topic.bad}}</div>
      <div class="operation-panel">Comments</div>
    </div>
    <NewComment :topic="topic" />
  </div>
</template>

<script>
  import { mapActions } from 'vuex';
  import { PARTY_PARAMS } from '../../constants';
  import NewComment from '../comments/new';

  export default {
    props: ["topic"],
    data(){
      return {
        openContent: false
      };
    },
    computed: {
      parties(){ return PARTY_PARAMS; },
      position(){
        return ["反対", "質問", "賛成"][this.topic.position + 1];
      }
    },
    components: {
      NewComment
    },
    methods: {
      ...mapActions(["makeGood", "makeBad"]),
      toggleContent(){
        console.log(this);
        this.openContent = !this.openContent;
      }
    }
  }
</script>

<style scoped>
  .topic {
    padding: 10px;
    border: 1px solid #E0E0E0;
    border-radius: 3px;
    background: #FFF;
  }
  .description {
    color: #888;
  }
  .topic-operation {
    display: flex;
    margin-top: 10px;
    border-top: 1px solid #AAA;
    border-bottom: 1px solid #AAA;
  }
  .operation-panel {
    flex: 1;
    padding: 3px 0px;
    text-align: center;
    cursor: pointer;
    transition: all .3s 0s ease;
  }
  .operation-panel:hover {
    background: #EEE;
  }
  .open-content p {
    margin: 0px;
  }
  .open-content-btn {
    color: #337ab7;
    cursor: pointer;
  }
  .open-content-btn:hover {
    text-decoration: underline;
  }
</style>