<template>
  <div id="app" class="container-fluid">
    <HeaderMenu />
    <div id="contentBox">
      <router-view />
    </div>
    <FooterMenu />
  </div>
</template>

<script>
  import { mapActions } from 'vuex';
  import HeaderMenu     from './components/header';
  import FooterMenu     from './components/footer';

  export default {
    components: {
      HeaderMenu,
      FooterMenu
    },
    methods: {
      ...mapActions(["getCurrentUser", "getNotifications"])
    },
    created(){
      this.getCurrentUser();
      this.getNotifications();
    },
    updated(){
      this.getNotifications();
    }
  }
</script>

<style scoped>
  #contentBox {
    margin-top: 60px;
  }
</style>