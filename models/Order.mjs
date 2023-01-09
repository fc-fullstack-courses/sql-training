import { mapOrders } from '../utils/index.mjs';

class Order {
  static _client;
  static _tableName = 'orders';

  static async bulkCreate(users) {
    const { rows } = await Order._client.query(`
    INSERT INTO ${Order._tableName} (
      user_id
    )
    VALUES ${mapOrders(users)}
    RETURNING id;
    `);

    return rows;
  }
}

export default Order;
