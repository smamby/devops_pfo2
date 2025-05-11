const mysql = require('mysql2/promise');


const pool = mysql.createPool({
  host: 'db',
  user: 'root',
  password: 'admin',
  database: 'db_pfo2',
  port: 3306,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// pool.connect(err => {
//   if (err) {
//     return console.error('Error de conexión:', err.message);
//   }
//   console.log('Conectado a MySQL');
// });

module.exports = pool;