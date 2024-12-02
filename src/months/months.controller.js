import { connection } from "../db/connect.js";

export const get_all = async (data, res, next) => {
    let sql = "SELECT * FROM months";
    const rows = await connection.query(sql);
    if(!rows.length) return res.status(204).json({message: "Nessun mese trovato"});
    
    return res.status(200).json({months: rows[0]});
};
