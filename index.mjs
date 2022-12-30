import pg from 'pg';
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

const { rows } = await client.query(`
  INSERT INTO users (
    "name", 
    "email", 
    "password", 
    "phone_num"
    )
  VALUES ${mapUsers(users)}
  RETURNING *;
`);

console.log(rows);

await client.end();
