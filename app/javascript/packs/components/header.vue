<template>
  <header id="header">
    <div class="col-sm-3">
      <router-link to="/" class="logo-link">
        <h1 @click="closeMenu">Social Action <br class="hidden-xs" />Initiatives</h1>
      </router-link>
    </div>
    <div v-if="open" @click="closeMenu">
      <div class="col-sm-2 header-menu-item">
        <router-link to="/" class="header-menu-link">
          <i class="icon ion-earth menu-icon"></i>
          <p class="menu-text">topics</p>
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
      <div class="col-sm-2 header-menu-item">
        <router-link to="/notifications" class="header-menu-link notification-box">
          <i class="icon ion-information-circled menu-icon"></i>
          <p class="menu-text">notifications</p>
          <p v-if="unopenedNotifications" class="unopened-pc hidden-xs">{{unopenedNotifications}}</p>
        </router-link>
      </div>
      <div class="col-sm-1 header-menu-item">
        <router-link to="/settings" class="header-menu-link">
          <i class="icon ion-gear-b menu-icon"></i>
          <p class="menu-text visible-xs">settings</p>
        </router-link>
      </div>
    </div>
    <i class="icon ion-navicon-round open-menu visible-xs" @click="openMenu"></i>
    <p v-if="unopenedNotifications" class="unopened-mobile visible-xs">{{unopenedNotifications}}</p>
  </header>
</template>

<script>
  import { mapState, mapActions } from 'vuex';

  export default {
    data: () => {
      return {
        open: (window.innerWidth > 767)
      }
    },
    computed: {
      ...mapState(["notifications"]),
      unopenedNotifications(){
        return this.notifications.filter(notification => {
          return !notification.opened;
        }).length;
      }
    },
    methods: {
      openMenu(){
        this.open = !this.open;
      },
      closeMenu(){
        this.open = window.innerWidth > 767;
      }
    }
  }
</script>

<style scoped>
  #header {
    position: fixed;
    top: 0px;
    left: 0px;
    width: 100%;
    background: rgba(255,255,255,.7);
    box-shadow: 0px 1px 3px rgba(0,0,0,.5);
    z-index: 3;
  }
  h1 {
    margin: 8px 25px 8px 0px;
    color: #666;
    font-size: 20px;
  }
  .logo-link:hover {
    text-decoration: none;
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
    top: -2px;
    right: 10px;
    font-size: 30px;
  }
  .notification-box {
    position: relative;
  }
  .unopened-pc {
    position: absolute;
    width: 20px;
    top: 3px;
    right: 30px;
    border-radius: 50%;
    background: #E65100;
    color: #FFF;
    font-weight: bold;
  }
  .unopened-mobile {
    position: absolute;
    width: 20px;
    top: 3px;
    right: 30px;
    border-radius: 50%;
    background: #E65100;
    color: #FFF;
    font-weight: bold;
    text-align: center;
  }
</style>