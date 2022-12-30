import pg from 'pg';
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

const users = [
  {
    name: 'TEST USER 123456',
    email: 'testMail123456@test.test',
    password: '548tg4fb8fb2rt248212321',
    phoneNum: '12431434',
  },
  {
    name: 'TEST USER 213423',
    email: 'testMail4543546@test.test',
    password: 'fdsfdg45345',
    phoneNum: '235454643',
  },
];

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
