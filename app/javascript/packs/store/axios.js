import axios from 'axios';
import { API_DOMAIN } from '../constants';

const API_URL_BASE = location.host === "localhost:3000" ? "http://localhost:3000/api" : API_DOMAIN + "/api";

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
    const url = API_URL_BASE + path;
    return axios.get(url, params);
  },
  post(path, params = {}){
    const url = API_URL_BASE + path;
    return axios.post(url, setToken(params));
  },
  put(path, params = {}){
    const url = API_URL_BASE + path;
    params.append("_method", "PUT");
    return axios.put(url, setToken(params));
  },
  delete(path, params = {}){
    const url = API_URL_BASE + path;
    params.append("_method", "DELETE");
    return axios.post(url, { data: setToken(params) });
  },
}