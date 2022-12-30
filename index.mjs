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

const user = {
  name: 'TEST USER 12345',
  email: 'testMail12345@test.test',
  password: '548tg4fb8fb2rt2482',
  phoneNum: '7985648645',
};

await client.connect();

const { rows } = await client.query(`
  INSERT INTO users (
    "name", 
    "email", 
    "password", 
    "phone_num"
    )
  VALUES (
    '${user.name}',
    '${user.email}',
    '${user.password}',
    '${user.phoneNum}'
  ) RETURNING *;
`);

console.log(rows);

await client.end();
