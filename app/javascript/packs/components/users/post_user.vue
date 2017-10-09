<template>
  <div class="post-user row">
    <div class="post-user-photo col-xs-3 col-sm-1">
      <router-link :to="`/users/${user.id}`">
        <img :src="user.photo || require('../../assets/images/general/no-profile.png')" class="post-user-photo" width="100%" />
      </router-link>
    </div>
    <div class="col-xs-9 col-sm-11">
      <p class="post-user-name"><router-link :to="`/users/${user.id}`">{{user.name}}</router-link></p>
      <p class="post-user-info">({{area}} / {{age}})</p>
    </div>
  </div>
</template>

<script>
  export default {
    props: ["user"],
    computed: {
      age(){
        const age = new Date().getFullYear() - this.user.birth_year;
        return `${age - 1}〜${age}歳`;
      },
      area(){
        let area = this.user.area || "";
        area += (this.user.district ? this.user.district + "区" : "");
        return area || "エリア非公開";
      }
    }
  }
</script>

<style scoped>
  .post-user-photo {
  }
  .post-user-name {
    margin: 8px 0px 0px;
  }
  .post-user-info {
    margin: 0px;
  }
</style>