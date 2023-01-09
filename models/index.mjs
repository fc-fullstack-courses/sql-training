import pg from 'pg';
import config from '../configs/db.json' assert { type: 'json' };
import User from './User.mjs';
import Product from './Product.mjs';
import Order from './Order.mjs';

const { Client } = pg;
const client = new Client(config);

User._client = client;
Product._client = client;
Order._client = client;

const db = { client, User, Product, Order };

export default db;
