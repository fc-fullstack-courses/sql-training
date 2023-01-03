import { mapUsers } from '../utils/index.mjs';

class User {
  static _client;
  static _tableName = 'users';

  static async bulkCreate(users) {
    const { rows } = await User._client.query(`
  INSERT INTO users (
    "first_name",
    "last_name",
    "email",
    "password",
    "phone_num",
    "birthday",
    "is_male",
    "height",
    "weigth"
    )
  VALUES ${mapUsers(users)}
  RETURNING *;
`);

    return rows;
  }
}

export default User;