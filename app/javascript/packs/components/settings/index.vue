<template>
  <div style="padding: 10px;">
    <button class="btn btn-danger" @click="signOut">ログアウト</button>
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