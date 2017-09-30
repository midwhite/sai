import axios from 'axios';

const API_DOMAIN = location.host === "localhost:3000" ? "http://localhost:3000/api" : "https://www.social-action-initiatives.org/api";

const setToken = params => {
  const token = document.querySelector("meta[name=csrf-token]").content;
  if(typeof params.append === "function"){
    params.append("authenticity_token", token);
  } else {
    params.authenticity_token = token;
  }
  return params;
};

export default {
  get(path, params = {}){
    const url = API_DOMAIN + path;
    return axios.get(url, params);
  },
  post(path, params = {}){
    const url = API_DOMAIN + path;
    return axios.post(url, setToken(params));
  },
  put(path, params = {}){
    const url = API_DOMAIN + path;
    const token = document.querySelector("meta[name=csrf-token]").content;
    params.append("authenticity_token", token);
    return axios.put(url, setToken(params));
  },
  delete(path, params = {}){
    const url = API_DOMAIN + path;
    return axios.delete(url, setToken(params));
  },
}