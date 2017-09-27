<template>
  <div id="app">
    <HeaderMenu />
    <router-view />
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
