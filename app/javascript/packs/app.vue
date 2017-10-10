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
      this.$ga.page(location.pathname + location.search);
    },
    updated(){
      this.getNotifications();
      this.$ga.page(location.pathname + location.search);
    }
  }
</script>

<style scoped>
  #contentBox {
    margin-top: 60px;
  }
  @media screen and (max-width: 767px){
    #contentBox {
      margin-top: 40px;
    }
  }
</style>