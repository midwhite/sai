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
import HeaderMenu from './components/header';
import FooterMenu from './components/footer';

export default {
  components: {
    HeaderMenu,
    FooterMenu
  }
}
</script>

<style scoped>
  #contentBox {
    margin-top: 60px;
  }
</style>