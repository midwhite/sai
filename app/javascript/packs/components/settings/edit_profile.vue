<template>
  <div id="edit-profile" class="row">
    <div class="col-sm-12 contentBox">
      <h2>プロフィール編集</h2>
      <form id="edit-user-form" @submit="onSubmit">
        <table class="table table-bordered">
          <tbody>
            <tr>
              <th><label for="edit_user_name">ユーザー名</label></th>
              <td>
                <input type="text" name="user[name]" id="edit_user_name" class="form-control" placeholder="ユーザー名" :value="currentUser.name" />
              </td>
            </tr>
            <tr v-if="!(currentUser.gender || currentUser.gender === 0)" class="required-prop">
              <th><label for="edit_user_gender">性別*</label></th>
              <td>
                <select name="user[gender]" class="form-control" id="edit_user_gender" required>
                  <option value="">選択してください</option>
                  <option v-for="(gender, i) in genders" :value="i">{{gender}}</option>
                </select>
              </td>
            </tr>
            <tr v-if="!currentUser.birth_year" class="required-prop">
              <th><label for="edit_user_birth_year">誕生年*</label></th>
              <td>
                <input type="number" name="user[birth_year]" id="edit_user_birth_year" class="form-control" placeholder="誕生年" :min="new Date().getFullYear() - 100" :max="new Date().getFullYear()" required />
              </td>
            </tr>
            <tr>
              <th><label for="edit_user_area">エリア</label></th>
              <td>
                <select name="user[area]" class="form-control" id="edit_user_area" :value="currentUser.area">
                  <option value="">非公開</option>
                  <option v-for="area in areas" :value="area">{{area}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <th><label for="edit_user_industry">業種</label></th>
              <td>
                <select name="user[industry]" class="form-control" id="edit_user_industry" :value="currentUser.industry">
                  <option value="">非公開</option>
                  <option v-for="industry in industries" :value="industry">{{industry}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <th><label for="edit_user_job">職種</label></th>
              <td>
                <select name="user[job]" class="form-control" id="edit_user_job" :value="currentUser.job">
                  <option value="">非公開</option>
                  <option v-for="job in jobs" :value="job">{{job}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <th><label for="edit_user_policy_field">重視する政策分野</label></th>
              <td>
                <select name="user[policy_field]" class="form-control" id="edit_user_policy_field" :value="currentUser.policy_field">
                  <option value="">特になし</option>
                  <option v-for="(policy, i) in policies" :value="i">{{policy}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <th><label for="edit_user_university">出身大学</label></th>
              <td>
                <input type="text" name="user[university]" id="edit_user_university" class="form-control" placeholder="出身大学" />
              </td>
            </tr>
            <tr>
              <th><label for="edit_user_major">専攻</label></th>
              <td>
                <select name="user[major]" class="form-control" id="edit_user_major" :value="currentUser.major">
                  <option value="">非公開</option>
                  <option v-for="major in majors" :value="major">{{major}}</option>
                </select>
              </td>
            </tr>
            <tr>
              <th><label for="edit_user_profile">プロフィール</label></th>
              <td>
                <textarea type="number" name="user[profile]" id="edit_user_profile" class="form-control" placeholder="プロフィール" rows="10" :value="currentUser.profile" />
              </td>
            </tr>
          </tbody>
        </table>
        <div class="btn-area">
          <input type="submit" class="btn btn-submit" />
        </div>
      </form>
    </div>
  </div>
</template>

<script>
  import { mapState, mapActions } from 'vuex';
  import { GENDER_PARAMS, AREA_PARAMS, INDUSTRY_PARAMS, JOB_PARAMS, POLICY_PARAMS, MAJOR_PARAMS } from '../../constants';

  export default {
    computed: {
      ...mapState(["currentUser"]),
      genders()   { return GENDER_PARAMS;   },
      areas()     { return AREA_PARAMS;     },
      industries(){ return INDUSTRY_PARAMS; },
      jobs()      { return JOB_PARAMS;      },
      policies()  { return POLICY_PARAMS;   },
      majors()    { return MAJOR_PARAMS;   }
    },
    methods: {
      ...mapActions(["editUser"]),
      onSubmit(e){
        e.preventDefault();
        this.editUser(new FormData(e.target));
        this.$router.push(`/users/${this.currentUser.id}`);
      }
    }
  }
</script>

<style scoped>
  .contentBox {
    background: #FFF;
  }
  #edit-profile h2 {
    padding: 10px;
    margin: 10px 0px;
  }
  #edit-user-form label {
    width: 100%;
    margin: 0px;
  }
  #edit-user-form table {
    margin: 0px;
    border: 0px;
  }
  #edit-user-form th, #edit-user-form td {
    vertical-align: middle;
  }
  #edit-user-form th {
    width: 150px;
  }
  .required-prop {
    background: #FFEBEE;
  }
  .btn-area {
    padding: 10px;
    text-align: right;
  }
  @media screen and (max-width: 767px){
    #edit-user-form tr {
      padding: 10px 5px 5px;
      display: block;
    }
    #edit-user-form th, #edit-user-form td {
      width: 100%;
      padding: 3px 0px;
      border: 0px;
      display: block;
    }
  }
</style>