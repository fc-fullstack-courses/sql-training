import _ from 'lodash';
import generationConfig from '../configs/generation.json' assert { type: 'json' };

const {
  users: { maxHeight, maxWeigth, minHeight, minWeigth },
  products: {
    categories,
    manufacturers,
    maxPrice,
    maxQuantity,
    minPrice,
    minQuantity,
    amountProducts,
  },
  orders: { minOrders, maxOrders },
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

function createProductQueryValues(value, index) {
  return `(
    'Product ${index}',
    ${_.random(minPrice, maxPrice, true)},
    ${_.random(minQuantity, maxQuantity, false)},
    '${categories[_.random(0, categories.length - 1, false)]}',
    '${manufacturers[_.random(0, manufacturers.length - 1, false)]}'
  )`;
}

export const mapUsers = (users) => {
  const usersElems = users.map(createUserQueryValues);
  return usersElems.join(',');
};

export const mapProducts = (amountOfProducts = amountProducts) => {
  const usersElems = new Array(amountOfProducts)
    .fill(undefined)
    .map(createProductQueryValues)
    .join(',');
  return usersElems;
};

export const mapOrders = (users) =>
  users
    .map((user) =>
      new Array(_.random(minOrders, maxOrders, false))
        .fill(undefined)
        .map(() => `(${user.id})`)
        .join(',')
    )
    .join(',');
