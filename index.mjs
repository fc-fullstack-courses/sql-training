import pg from 'pg';
import fs from 'fs/promises';
import config from './configs/db.json' assert { type: 'json' };
import User from './models/User.mjs';
import Product from './models/Product.mjs';
import { getUsers } from './api/index.mjs';
const { Client } = pg;

const client = new Client(config);

User._client = client;
Product._client = client;
const users = await getUsers();

await client.connect();

const resetDBQuery = await fs.readFile('./sql/not-rozetka/tables.sql', 'utf-8');

await client.query(resetDBQuery);

const createdUsers = await User.bulkCreate(users);
const products = await Product.bulkCreate();

console.log(createdUsers);

await client.end();
