<template>
  <div id="app">
    <p>{{ firstMessage }}</p>
  </div>
</template>

<script>
import { mapState, mapGetters } from 'vuex';

export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  computed: {
    ...mapState(["messages"]),
    ...mapGetters(["firstMessage"])
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
