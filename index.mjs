import pg from 'pg';
import fs from 'fs/promises';
import config from './configs/db.json' assert { type: 'json' };
import User from './models/User.mjs';
import { getUsers } from './api/index.mjs';
const { Client } = pg;

const client = new Client(config);

User._client = client;

const users = await getUsers();

await client.connect();

const resetDBQuery = await fs.readFile('./sql/not-rozetka/tables.sql', 'utf-8');

await client.query(resetDBQuery);

const createdUsers = await User.bulkCreate(users);

console.log(createdUsers);

await client.end();
