import { mapProducts } from '../utils/index.mjs';

class Product {
  static _client;
  static _tableName = 'products';

  static async bulkCreate(numberOfProducts) {
    const { rows } = await Product._client.query(`
  INSERT INTO ${Product._tableName} (
    "name",
    "price",
    "quantity",
    "category",
    "manufacturer"
    )
  VALUES ${mapProducts(numberOfProducts)}
  RETURNING *;
`);

    return rows;
  }
}

export default Product;
