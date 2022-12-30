import pg from 'pg';
const { Client } = pg;

const config = {
  user: 'postgres',
  password: 'postgres',
  host: 'localhost',
  port: 5432,
  database: 'not_rozetka',
};

const client = new Client(config);

await client.connect();

const { rows } = await client.query('SELECT * FROM users;');

console.log(rows);

await client.end();
