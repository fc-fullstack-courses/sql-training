import fs from 'fs/promises';
import _ from 'lodash';
import models from './models/index.mjs';
import { getUsers } from './api/index.mjs';
import generationConfig from './configs/generation.json' assert { type: 'json' };
import { mapOrdersToProducts } from './utils/index.mjs';

const {
  orders: { chanceToMakeOrder },
} = generationConfig;

const { client, User, Product, Order } = models;

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

const ordersWithProductsRes = await client.query(`
INSERT INTO orders_to_products (
  order_id,
  product_id,
  quantity
)
VALUES ${mapOrdersToProducts(orders, products)}
RETURNING *;
`);

await client.end();
