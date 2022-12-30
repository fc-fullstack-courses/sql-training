import axios from 'axios';

const httpClient = axios.create({
  baseURL: 'https://randomuser.me/api/',
});

export const getUsers = async () => {
  const {
    data: { results },
  } = await httpClient.get('?results=500&seed=123456&page=1');
  return results;
};
