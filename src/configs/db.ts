import mysql from 'mysql2/promise';
import { RowDataPacket, createPool } from 'mysql2';
import config from './connectDb';
import pool from './connectDb';

async function queryDb(sql: any, params?: any) {
  const connection = await mysql.createConnection(config.db);
  const [results] = await connection.execute<RowDataPacket[]>(sql, params);

  return results;
}

export default queryDb;
