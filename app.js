const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');
const pool = require('./db'); // Importar el pool de conexiones

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

app.get('/data', async (req, res) => {
  try {
    const [rows] = await pool.execute('SELECT * FROM user');
    res.send(rows);
  } catch (err) {
    console.error('Error al realizar la consulta:', err);
    res.status(500).send('Error en el servidor');
  }
});

app.post('/data', async (req, res) => {
  const { name, email } = req.body;
  try {
    const [result] = await pool.execute('INSERT INTO user (name, email) VALUES (?, ?)', [name, email]);    
    res.send({ id: result.insertId, name, email });
  } catch (err) {
    console.error('Error al insertar datos:', err);
    res.status(500).send('Error en el servidor');
  }
});

app.listen(3001, () => {
  console.log('Servidor escuchando en el puerto 3001');
});