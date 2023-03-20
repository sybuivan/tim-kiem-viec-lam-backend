import mysql from 'mysql2/promise';
// // create the connection to database

const config = {
  db: {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'db_tim-kiem-viec-lam',
  },
  listPerPage: 10,
};
export default config;
