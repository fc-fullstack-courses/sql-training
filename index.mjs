import pg from 'pg';
import fs from 'fs/promises';
import { getUsers } from './api/index.mjs';
import { mapUsers } from './utils/index.mjs';
const { Client } = pg;

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'not_rozetka',
};

const client = new Client(config);

const users = await getUsers();

await client.connect();

const resetDBQuery = await fs.readFile('./sql/not-rozetka/tables.sql', 'utf-8');

await client.query(resetDBQuery);

// const { rows } = await client.query(`
//   INSERT INTO users (
//     "name", 
//     "email", 
//     "password", 
//     "phone_num"
//     )
//   VALUES ${mapUsers(users)}
//   RETURNING *;
// `);

// console.log(rows);

await client.end();
