<template>
  <div id="PageNotFound" class="row">
    <div class="col-sm-12">
      <h1>404</h1>
      <p class="status-message">Not Found</p>
      <router-link to="/" class="return-btn">TOPに戻る</router-link>
    </div>
  </div>
</template>

<style scoped>
  #PageNotFound {
    text-align: center;
  }
  h1 {
    font-size: 80px;
  }
  .status-message {
    font-size: 40px;
  }
  .return-btn {
    max-width: 500px;
    width: 80%;
    padding: 10px 0px;
    margin: 30px auto;
    border: 1px solid #212121;
    background: #FFF;
    color: #212121;
    font-size: 30px;
    display: block;
    transition: all .3s 0s ease;
  }
  .return-btn:hover {
    background: #EEE;
    text-decoration: none
  }
</style>