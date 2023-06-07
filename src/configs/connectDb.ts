import mysql from 'mysql2/promise';
// // create the connection to database

const config = {
  db: {
    host: process.env.HOST_DOMAIN,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
    port: 17612,
  },
  listPerPage: 10,
};
// const config = {
//   db: {
//     host: 'mysql-130608-0.cloudclusters.net',
//     user: 'admin',
//     password: '91zZOWF2',
//     database: 'db_tim-kiem-viec-lam',
//     port: 17612,
//   },
//   listPerPage: 10,
// };

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
