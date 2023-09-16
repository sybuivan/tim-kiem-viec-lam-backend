import mysql from 'mysql2/promise';
import { RowDataPacket } from 'mysql2';
import config from './connectDb';

const pool = mysql.createPool(config.db);

async function queryDb(sql: any, params?: any) {
  const connection = await pool.getConnection();
  try {
    const [results] = await connection.query<RowDataPacket[]>(sql, params);

    return results;
  } finally {
    connection.release();
  }
}
export default queryDb;
