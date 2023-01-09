import pg from 'pg';
import fs from 'fs/promises';
import _ from 'lodash';
import config from './configs/db.json' assert { type: 'json' };
import User from './models/User.mjs';
import Product from './models/Product.mjs';
import Order from './models/Order.mjs';
import { getUsers } from './api/index.mjs';
import generationConfig from './configs/generation.json' assert { type: 'json' };

const { Client } = pg;
const {
  orders: {
    chanceToMakeOrder,
    maxQuantity,
    minQuantity,
    minProductsInOrder,
    maxProductsInOrder,
  },
} = generationConfig;

const client = new Client(config);

User._client = client;
Product._client = client;
Order._client = client;

const users = await getUsers();

await client.connect();

const resetDBQuery = await fs.readFile('./sql/not-rozetka/tables.sql', 'utf-8');

await client.query(resetDBQuery);

const createdUsers = await User.bulkCreate(users);
const products = await Product.bulkCreate();

// создаем заказы
const orderingUsers = createdUsers.filter(
  () => _.random(0, 100) <= chanceToMakeOrder
);

const orders = await Order.bulkCreate(orderingUsers);

// наполнить заказы
const ordersToProductsString = orders
  .map((order) => {
    // отбор продуктов
    const productsInOrder = new Array(
      _.random(minProductsInOrder, maxProductsInOrder)
    )
      .fill(undefined)
      .map(() => products[_.random(0, products.length - 1)]);

    // отсортировать повторяющиеся продукты
    const filteredProducts = [...new Set(productsInOrder)];
    // вернуть строку типа (1, 4 , 18)
    return filteredProducts
      .map(
        (product) =>
          `(${order.id}, ${product.id}, ${_.random(minQuantity, maxQuantity)})`
      )
      .join(',');
  })
  .join(',');

await client.query(`
INSERT INTO orders_to_products (
  order_id,
  product_id,
  quantity
)
VALUES ${ordersToProductsString};
`);

await client.end();
