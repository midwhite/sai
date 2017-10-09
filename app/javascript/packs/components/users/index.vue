<template>
  <div id="users-list">
    <User v-for="user of users" :user="user" />
  </div>
</template>

<script>
  import axios from '../../store/axios';
  import User from './user';

  export default {
    data(){
      return { users: [] };
    },
    components: {
      User
    },
    mounted(){
      axios.get("/users").then(({data}) => {
        this.users = data.users;
      });
    }
  }
</script>

<style scoped>
  #users-list {
    padding-top: 10px;
  }
</style>