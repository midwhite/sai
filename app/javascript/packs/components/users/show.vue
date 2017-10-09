<template>
  <div id="show-user">
    <div class="return-btn-area">
      <a href="#/" @click="goBack" class="return-btn">>> 戻る</a>
    </div>
    <User :user="user" />
  </div>
</template>

<script>
  import axios from '../../store/axios';
  import User from './user';

  export default {
    data(){
      return {
        user: {}
      };
    },
    components: {
      User
    },
    methods: {
      goBack(e){
        e.preventDefault();
        this.$router.go(-1);
      },
      getUser(){
        axios.get(`/users/${this.$route.params.id}`).then(({data}) => {
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
  .return-btn {
    width: 150px;
    padding-top: 5px;
    display: block;
  }
</style>