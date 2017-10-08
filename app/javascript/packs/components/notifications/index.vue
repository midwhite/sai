<template>
  <div id="notifications" class="row">
    <h2>最近のアクティビティ</h2>
    <Notification v-for="notification of notifications" :notification="notification" />
    <p class="no-notification" v-if="notifications.length === 0">通知はありません。</p>
  </div>
</template>

<script>
  import { mapState, mapActions } from 'vuex';
  import Notification from './notification';

  export default {
    components: {
      Notification
    },
    computed: {
      ...mapState(["notifications"])
    },
    methods: {
      ...mapActions(["openNotifications"])
    },
    mounted(){
      this.openNotifications();
    }
  }
</script>

<style scoped>
  #notifications {
    padding: 1px 0px;
  }
  h2 {
    font-size: 16px;
    padding: 10px 0px;
    margin: 8px 0px;
    border: solid #AAA;
    border-width: 1px 0px;
    background: #FFF;
    text-align: center;
  }
  .no-notification {
    padding: 10px;
    background: #FFF;
  }
</style>