<template>
  <div class="topic">
    <p class="post-time">{{topic.created_at}}</p>
    <div class="topic-tags">
      <strong>{{parties[topic.target_id]}}</strong>
      <span>の</span>
      <strong>{{topic.policy}}</strong>
      <span>について</span>
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
      <div class="operation-panel" @click="toggleComment">Comments</div>
    </div>
    <Comments :topic="topic" v-if="openComment" />
  </div>
</template>

<script>
  import { mapActions } from 'vuex';
  import { PARTY_PARAMS, POSITION_PARAMS } from '../../constants';
  import Comments from '../comments';

  export default {
    props: ["topic"],
    data(){
      return {
        openContent: false,
        openComment: false
      };
    },
    computed: {
      parties(){ return PARTY_PARAMS; },
      position(){ return POSITION_PARAMS[this.topic.position]; }
    },
    components: {
      Comments
    },
    methods: {
      ...mapActions(["makeGood", "makeBad"]),
      toggleContent(){
        this.openContent = !this.openContent;
      },
      toggleComment(){
        this.openComment = !this.openComment;
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
  .post-time {
    margin: 5px;
    text-align: right;
  }
</style>