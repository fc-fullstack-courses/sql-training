import _ from 'lodash';
import generationConfig from '../configs/generation.json' assert { type: 'json' };

const {
  users: { maxHeight, maxWeigth, minHeight, minWeigth },
} = generationConfig;

function createUserQueryValues(user) {
  const {
    name: { first, last },
    email,
    login: { sha256: password },
    phone,
    dob: { date: birthday },
    gender,
  } = user;
  return `(
    '${first}',
    '${last}',
    '${email}',
    '${password}',
    '${phone}',
    '${birthday}',
    ${gender === 'male'},
    ${_.random(minHeight, maxHeight, true)},
    ${_.random(minWeigth, maxWeigth, true)}
  )`;
}

export const mapUsers = (users) => {
  const usersElems = users.map(createUserQueryValues);
  return usersElems.join(',');
};
