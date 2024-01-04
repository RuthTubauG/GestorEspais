// Importem express
const express = require("express");
const app = express();

app.use(express.static("public"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Importem el mòdul MySQL
const mysql = require("mysql");

// Configuració de la conexió a la base de dades MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'RuthTubau',
  password: 'RuthTubau',
  database: 'bd_gestor_espais'
});

// Connectem la base de dades MySQL
db.connect(err => {
  if (err) {
    console.error('Error en obrir la base de dades:', err.message);
  } else {
    console.log('Connexió exitosa a la base de dades MySQL.');

    // Crear la taula espais (si no existeix)
    db.query(`CREATE TABLE IF NOT EXISTS espais (
      localitzacio VARCHAR(255),
      numero_de_salas INT,
      id INT PRIMARY KEY
    )`, err => {
      if (err) {
        console.error('Error al crear la taula espais:', err.message);
      } else {
        console.log('Taula espais creada o ja existent.');
      }
    });

    // Crear la taula usuaris (si no existeix)
    db.query(`CREATE TABLE IF NOT EXISTS usuaris (
      nom VARCHAR(255),
      cognom VARCHAR(255),
      mail VARCHAR(255),
      id INT PRIMARY KEY
    )`, err => {
      if (err) {
        console.error('Error al crear la taula usuaris:', err.message);
      } else {
        console.log('Taula usuaris creada o ja existent.');
      }
    });

    // Crear la taula salas (si no existeix)
    db.query(`CREATE TABLE IF NOT EXISTS salas (
      tipo_sala VARCHAR(255),
      nom_sala VARCHAR(255),
      numero_sala INT,
      metros_cuadrats VARCHAR(255),
      capacitat INT,
      homologacio VARCHAR(255),
      disponibilitat VARCHAR(255),
      id INT PRIMARY KEY,
      id_espais  INT,
      FOREIGN KEY (id_espais) REFERENCES espais(id)
    )`, err => {
      if (err) {
        console.error('Error al crear la taula salas:', err.message);
      } else {
        console.log('Taula salas creada o ja existent.');
      }
    });

    // Crear la taula reservas (si no existeix)
    db.query(`CREATE TABLE IF NOT EXISTS reservas (
      data_inici DATE,
      data_fi DATE,
      horari TIME,
      disponibilitat VARCHAR(255),
      id INT PRIMARY KEY,
      id_salas INT,
      id_usuaris INT,
      FOREIGN KEY (id_salas) REFERENCES salas(id),
      FOREIGN KEY (id_usuaris) REFERENCES usuaris(id)
    )`, err => {
      if (err) {
        console.error('Error al crear la taula reservas:', err.message);
      } else {
        console.log('Taula reservas creada o ja existent.');
      }
    });
  }
});

// Ruta per obtenir/veure les sales
app.get('/salas', (req, res) => {
  const query = `SELECT * FROM salas`;
  db.query(query, (err, rows) => {
    if (err) {
      console.error('Error al obtenir les sales', err.message);
      res.status(500).json({ error: 'Error al obtenir sales' });
    } else {
      console.log('Dades de sales:', rows);
      res.json(rows);
    }
  });
});

// Ruta per crear una reserva
app.post('/reservas', (req, res) => {
  const { data_inici, data_fi, horari, disponibilitat, id, id_salas, id_usuaris } = req.body;

  const query = `
    INSERT INTO RESERVAS (data_inici, data_fi, horari, disponibilitat, id, id_salas, id_usuaris)
    VALUES (?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(query, [ data_inici, data_fi, horari, disponibilitat, id, id_salas, id_usuaris], (err, result) => {
    if (err) {
      console.error('Error al crear reserva:', err.message);
      res.status(500).json({ error: 'Error al crear reserva' });
    } else {
      const newReserva = {
        id: result.insertId,
        data_inici,
        data_fi,
        horari,
        disponibilitat,
        id,
        id_salas,
        id_usuaris
      };
      res.status(201).json(newReserva);
    }
  });
});

// Ruta per veure els espais disponibles
app.get('/espais', (req, res) => {
  const query = `SELECT * FROM espais WHERE numero_de_salas > 0`;
  db.query(query, (err, rows) => {
    if (err) {
      console.error('Error al obtenir els espais disponibles:', err.message);
      res.status(500).json({ error: 'Error al obtenir els espais disponibles' });
    } else {
      res.json(rows);
    }
  });
});

// Port
app.listen(2001, () => {
  console.log("L'aplicació està escoltant al port 2001.");
});

// Tancar la connexió de MySQL en finalitzar l'aplicació
process.on('SIGINT', () => {
  db.end(err => {
    if (err) {
      return console.error('Error al tancar la connexió de MySQL:', err.message);
    }
    console.log('Connexió de MySQL tancada.');
    process.exit(0);
  });
});

