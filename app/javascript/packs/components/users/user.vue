<template>
  <div class="user-detail">
    <div v-if="user">
      <div class="row">
        <div class="user-photo col-xs-4">
          <img :src="user.photo || require('../../assets/images/general/no-profile.png')" width="100%" />
        </div>
        <div class="col-xs-8">
          <h3>{{user.name}}</h3>
          <p>{{age}} {{gender}}</p>
          <p>選挙区: {{user.area}} {{user.district || "-"}}区</p>
          <p>業種: {{user.industry || "非公開"}} / 職種: {{user.job || "非公開"}}</p>
          <p>出身校: {{user.university || "非公開"}}</p>
          <p>専攻: {{major}}</p>
          <p>重視する政策領域: {{policy}}</p>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <div v-if="user.profile">
            <p v-for="sentense of user.profile.split(/\n|\r|\r\n/)">{{sentense}}</p>
          </div>
          <p v-else style="color: #AAA;">No Profile</p>
        </div>
      </div>
      <div class="row user-topics">
        <Topic v-for="topic of userTopics" :topic="topic" />
      </div>
    </div>
    <div v-else>
      <p>該当のユーザーが見つかりません。既に退会した可能性があります。</p>
    </div>
  </div>
</template>

<script>
  import { mapState } from 'vuex';
  import Topic from '../topics/topic';
  import { GENDER_PARAMS, POLICY_PARAMS, MAJOR_PARAMS } from '../../constants';

  export default {
    props: ["user"],
    computed: {
      ...mapState(["topics"]),
      gender(){
        return GENDER_PARAMS[this.user.gender];
      },
      age(){
        const age = new Date().getFullYear() - this.user.birth_year;
        return `${age - 1}〜${age}歳`;
      },
      policy(){
        return POLICY_PARAMS[this.user.policy_field] || "特になし";
      },
      major(){
        return MAJOR_PARAMS[this.user.major] || "特になし";
      },
      userTopics(){
        return this.topics.filter(topic => {
          return topic.user.id === this.user.id;
        });
      }
    },
    components: {
      Topic
    }
  }
</script>

<style scoped>
  .user-detail {
    margin-top: 8px;
    padding: 10px;
    background: #FFF;
  }
  h3 {
    margin: 0px;
  }
</style>