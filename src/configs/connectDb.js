const mysql = require('mysql2/promise');
// // create the connection to database

const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  database: 'tim-kiem-viec',
});

pool.getConnection((err) => {
  if (err) console.log(JSON.stringify(err));
  else {
    console.log('Connected with mysql');
  }
});

module.exports = pool;
