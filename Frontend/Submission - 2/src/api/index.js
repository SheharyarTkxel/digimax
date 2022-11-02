import axios from "axios";
import { GET, ADD, SEARCH, DELETE } from "./urls";
//show fetch
export const getDictionary = () => {
  return axios
    .get(GET)
    .then((res) => {
      return res.data.data;
    })
    .catch((err) => console.log(err));
};
//  data add?
export const addWord = (word) => {
  return axios
    .post(ADD, {
      word,
    })
    .then((res) => ({ message: res.data.message, notification: "success" }))
    .catch((err) => ({
      message: err.response.data.errors,
      notification: "error",
    }));
};
// delete?
export const removeWord = (word) => {
  return axios
    .delete(DELETE, {
      data: {
        word,
      },
      // specific data
    })
    .then((res) => ({ message: res.data.message, notification: "success" }))
    .catch((err) => ({
      message: err.response.data.errors,
      notification: "error",
    }));
};
// search?
export const searchDictionary = (word) => {
  if (word !== "") {
    return axios
      .get(`${SEARCH}${word}`)
      .then((res) => {
        return res.data.data;
      })
      .catch((err) => console.log(err));
  } else {
    return getDictionary();
  }
};
