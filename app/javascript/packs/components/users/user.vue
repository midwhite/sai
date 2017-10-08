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
          <p>重視する政策領域: {{policy}}</p>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <p v-if="user.profile" v-for="sentense of user.profile.split(/\n|\r|\r\n/)">{{sentense}}</p>
          <p v-else style="color: #AAA;">No Profile</p>
        </div>
      </div>
    </div>
    <div v-else>
      <p>該当のユーザーが見つかりません。既に退会した可能性があります。</p>
    </div>
  </div>
</template>

<script>
  import axios from '../../store/axios';
  import { GENDER_PARAMS, POLICY_PARAMS } from '../../constants';

  export default {
    props: ["id"],
    data(){
      return {
        user: null
      };
    },
    computed: {
      gender(){
        return GENDER_PARAMS[this.user.gender];
      },
      age(){
        const age = new Date().getFullYear() - this.user.birth_year;
        return `${age - 1}〜${age}歳`;
      },
      policy(){
        return POLICY_PARAMS[this.user.policy_field] || "特になし";
      }
    },
    methods: {
      getUser(){
        axios.get(`/users/${this.id}`).then(({data}) => {
          this.user = data.user;
        }).catch((res) => {
          this.user = null;
        });
      }
    },
    mounted(){
      this.getUser();
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