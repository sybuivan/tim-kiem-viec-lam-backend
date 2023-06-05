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

// const config = {
//   db: {
//     host: 'mysql-127952-0.cloudclusters.net',
//     user: 'admin',
//     password: 'vPgn2oDF',
//     database: 'db_tim-kiem-viec-lam',
//     port: 19985,
//   },
//   listPerPage: 10,
// };
export default config;
