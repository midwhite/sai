<template>
  <header id="header">
    <div class="col-sm-4">
      <router-link to="/">
        <img :src="require('../assets/images/general/header-logo.png')" class="logo" @click="closeMenu" />
      </router-link>
    </div>
    <div v-if="open" @click="closeMenu">
      <div class="col-sm-2 header-menu-item">
        <router-link to="/" class="header-menu-link">
          <i class="icon ion-earth menu-icon"></i>
          <p class="menu-text">home</p>
        </router-link>
      </div>
      <div class="col-sm-2 header-menu-item">
        <router-link to="/dictionary" class="header-menu-link">
          <i class="icon ion-map menu-icon"></i>
          <p class="menu-text">dictionary</p>
        </router-link>
      </div>
      <div class="col-sm-2 header-menu-item">
        <router-link to="/teams" class="header-menu-link">
          <i class="icon ion-person-stalker menu-icon"></i>
          <p class="menu-text">teams</p>
        </router-link>
      </div>
      <div class="col-sm-2 visible-xs header-menu-item">
        <router-link to="/teams" class="header-menu-link">
          <i class="icon ion-information-circled menu-icon"></i>
          <p class="menu-text">notifications</p>
        </router-link>
      </div>
      <div class="col-sm-2 header-menu-item">
        <router-link to="/settings" class="header-menu-link">
          <i class="icon ion-gear-b menu-icon"></i>
          <p class="menu-text">settings</p>
        </router-link>
      </div>
    </div>
    <i class="icon ion-navicon-round open-menu visible-xs" @click="openMenu"></i>
  </header>
</template>

<script>
export default {
  data: () => {
    return {
      open: (window.innerWidth > 767)
    }
  },
  methods: {
    openMenu(){
      this.open = !this.open;
    },
    closeMenu(){
      this.open = false;
    }
  }
}
</script>

<style scoped>
  #header {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    background: #FFF;
    z-index: 3;
  }
  .logo {
    height: 50px;
    margin: 5px;
  }
  .header-menu-item {
    padding: 0px;
  }
  .header-menu-link {
    padding: 6px 0px;
    text-align: center;
    display: block;
    transition: all .3s 0s ease;
  }
  .header-menu-link:hover {
    background: #EEE;
    text-decoration: none;
  }
  .menu-icon {
    font-size: 20px;
  }
  .menu-text {
    margin: 0px;
  }
  .open-menu {
    position: absolute;
    top: 5px;
    right: 10px;
    font-size: 30px;
  }
</style>