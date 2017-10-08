<template>
  <div id="show-user">
    <div class="return-btn-area">
      <a href="#/" @click="goBack" class="return-btn">>> 戻る</a>
    </div>
    <User :id="$route.params.id" />
  </div>
</template>

<script>
  import User from './user';

  export default {
    components: {
      User
    },
    methods: {
      goBack(e){
        e.preventDefault();
        this.$router.go(-1);
      }
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