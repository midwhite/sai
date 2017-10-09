<template>
  <div class="sort-panel-component">
    <div class="filter row">
      <div class="col-sm-12">
        <div class="panel-content">
          <p>フィルター</p>
          <select id="sort_panel_policy" class="input-sm" v-model="filterTopics.policy">
            <option value="">全ての政策分野</option>
            <option v-for="policy of policies" :value="policy">{{policy}}</option>
          </select>
          <select id="sort_panel_party" class="input-sm" v-model="filterTopics.party">
            <option value="">全ての政党</option>
            <option v-for="party of parties" :value="partyVal(party)">{{party}}</option>
          </select>
          <select id="sort_panel_position" class="input-sm" v-model="filterTopics.position">
            <option value="">全てのタイプ</option>
            <option v-for="position of positions" :value="positionVal(position)">{{position}}</option>
          </select>
        </div>
      </div>
    </div>
    <div class="sort row">
      <div class="col-sm-12">
        <div class="panel-content">
          <p>ソート</p>
          <select id="sort_panel_policy" class="input-sm form-control" v-model="filterTopics.sort">
            <option value="newer">新着順</option>
            <option value="good">Goodが多い順</option>
            <option value="bad">Badが多い順</option>
          </select>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import { mapState } from 'vuex';
  import { PARTY_PARAMS, POSITION_PARAMS } from '../../constants';

  export default {
    computed: {
      ...mapState(["topics", "sortTopics", "filterTopics"]),
      policies(){
        return this.topics.map(topic => { return topic.policy; }).filter((x, i, self) => self.indexOf(x) === i);
      },
      parties(){
        return this.topics.map(topic => { return PARTY_PARAMS[topic.target_id]; }).filter((x, i, self) => self.indexOf(x) === i);
      },
      positions(){
        return this.topics.map(topic => { return POSITION_PARAMS[topic.position]; }).filter((x, i, self) => self.indexOf(x) === i);
      }
    },
    methods: {
      partyVal(value){
        return PARTY_PARAMS.indexOf(value);
      },
      positionVal(value){
        return POSITION_PARAMS.indexOf(value);
      }
    }
  }
</script>

<style scoped>
  .panel-content {
    margin: 10px 0px;
  }
</style>