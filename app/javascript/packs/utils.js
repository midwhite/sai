import { CDN_DOMAIN } from './constants';

export const random = (num) => {
  return Math.floor(Math.random() * num);
};

export const imagePath = (path) => {
  return CDN_DOMAIN + "/assets/images" + path + "?_=" + new Date().getTime();
};