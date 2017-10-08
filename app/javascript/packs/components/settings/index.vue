<template>
  <div id="settings" class="row">
    <div class="col-xs-4">
      <router-link to="/settings/profile" class="settings-menu-link">
        <i class="icon ion-person"></i>
        <p class="settings-menu">Edit Profile</p>
      </router-link>
    </div>
    <div class="col-xs-4">
      <a href="#/" class="settings-menu-link" @click="signOut">
        <i class="icon ion-log-out"></i>
        <p class="settings-menu">Sign Out</p>
      </a>
    </div>
  </div>
</template>

<script type="text/javascript">
  import axios from 'axios';

  export default {
    methods: {
      signOut(e){
        e.preventDefault();
        const token = document.querySelector("meta[name=csrf-token]").content;
        const formData = new FormData();
        formData.append("authenticity_token", token);
        formData.append("_method", "DELETE");
        axios.post("/users/sign_out", formData).then(({data}) => { location.href = "/"; });
      }
    }
  }
</script>

<style scoped>
  #settings {
    background: #FFF;
    min-height: 400px;
  }
  .settings-menu-link {
    padding: 10px 0px 1px;
    text-align: center;
    display: block;
    transition: all .3s 0s ease;
  }
  .settings-menu-link:hover {
    background: #EEE;
  }
  .settings-menu-link .icon {
    font-size: 20px;
  }
</style>