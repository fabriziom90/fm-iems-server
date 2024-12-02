import mysql from "mysql2";
import dotenv from "dotenv";

dotenv.config();

// createPool è un metodo che permette di creare un'insieme di connessioni riutilizzabili per le interazioni con il database mysql. Vengono create più connessioni per migliorare le prestazioni dato che vengono riutilizzate piuttosto che create per ogni richiesta.
export const connection = mysql.createPool({
    host: process.env.MYSQL_HOST,
    database: process.env.MYSQL_DATABASE,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD
}).promise();