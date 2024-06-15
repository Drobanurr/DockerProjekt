const express = require('express');
const app = express();
const port = 3000;

const { Client } = require('pg');

// Create a new client instance
const client = new Client({
  host: 'db', // or the IP address of your PostgreSQL server
  port: 5432,        // PostgreSQL server port
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME
});
client.connect()
  .then(() => {
    console.log('Connected to the database');
  })
  .catch((err) => {
    console.error('Connection error', err.stack);
  });
// Define the route to get all table names
app.get('/', async (req, res) => {

    const result = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
    `);
    res.json(result.rows);
});

// Start the Express server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

// Handle process termination gracefully
process.on('SIGTERM', () => {
  client.end().then(() => console.log('PostgreSQL client disconnected')).catch(console.error);
});

process.on('SIGINT', () => {
  client.end().then(() => console.log('PostgreSQL client disconnected')).catch(console.error);
});
