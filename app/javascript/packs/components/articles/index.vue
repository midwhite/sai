<template>
    <div class="articles">
    <div v-for="article of target.articles" class="row article">
      <div class="col-sm-3">
        <div class="ogp-image" :style="'background-image: url('+article.image+');'">
          <a :href="article.url" target="_blank" class="ogp-link"></a>
        </div>
      </div>
      <div class="col-sm-9">
        <p class="ogp-title"><a :href="article.url" target="_blank">{{article.title}}</a></p>
        <div class="ogp-description">{{article.description}}</div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: ["target"]
  }
</script>

<style scoped>
  .article {
    margin-top: 10px;
  }
  .ogp-image {
    height: 150px;
    background: center no-repeat;
    background-size: cover;
    box-shadow: 1px 1px 1px rgba(0,0,0,.5);
  }
  .ogp-link {
    height: 100%;
    display: block;
  }
  .ogp-description {
    color: #212121;
  }
  @media screen and (max-width: 767px){
    .ogp-title {
      margin-top: 10px;
      font-size: 18px;
    }
    .ogp-description {
      margin-bottom: 20px;
    }
  }
  @media screen and (min-height: 400px) and (max-width: 767px){
    .ogp-image {
      height: 250px;
    }
  }
</style>