
import "dotenv/config";
import mysql, { Pool } from "mysql2/promise";


const pool: Pool = mysql.createPool({
  host: process.env.DB_HOST ?? "localhost",
  port: Number(process.env.DB_PORT ?? 3306),
  user: process.env.DB_USER ?? "root",
  password: process.env.DB_PASSWORD ?? "",
  database: process.env.DB_NAME ?? "alchemy",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});


export async function testDb() {
  const conn = await pool.getConnection();
  try {
    await conn.ping();
    console.log("✅ Connexion MySQL OK");
  } finally {
    conn.release();
  }
}

export default pool;
