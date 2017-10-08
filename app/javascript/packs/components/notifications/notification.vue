<template>
  <div class="notification-component">
    <router-link :to="link" class="notify-link">
      <p class="notify-message">{{notification.content}}</p>
      <p class="notify-time">{{notification.created_at}}</p>
    </router-link>
  </div>
</template>

<script>
  export default {
    props: ["notification"],
    computed: {
      link(){
        switch(this.notification.type){
          case "comment":
            return "topics/" + this.notification.target_id;
          default:
            break;
        }
      }
    }
  }
</script>

<style scoped>
  .notification-component {
    padding: 10px;
    border-bottom: 2px solid #EEE;
    background: #FFF;
    transition: all .3s 0s ease;
  }
  .notification-component:hover {
    background: #EEE;
  }
  .notify-link {
    max-width: 500px;
    margin: 0px auto;
    display: block;
  }
  .notify-message {
    margin: 0px;
  }
  .notify-time {
    margin: 0px;
    color: #212121;
    text-align: right;
  }
</style>