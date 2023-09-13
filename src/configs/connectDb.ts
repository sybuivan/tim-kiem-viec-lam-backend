import mysql from 'mysql2/promise';
// // create the connection to database

const config: any = {
  db: {
    host: process.env.HOST_DOMAIN || 'mysql-143565-0.cloudclusters.net',
    user: process.env.USER || 'admin',
    password: process.env.PASSWORD || '83fNhnK7',
    database: process.env.DATABASE || 'db_tim-kiem-viec-lam',
    port: process.env.PORT ?? 15497,
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
