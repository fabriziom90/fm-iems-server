import { connection } from "../db/connect.js";
import { validationResult} from 'express-validator';

// This method get all incomes and exits values for one year
export const summary = async (req, res, next) => {
    
    try{
        //recover the year passed as param
        const sql_year = `SELECT years.year FROM years WHERE year = ${req.query.data}`;
        
        const result = await connection.execute(sql_year);
        
        // cycle over the results
        const promises = result[0].map(async (item) => {
            let obj = {
                year: item.year,
                months: []
            }

            // with this query we will get all the incomes and exits for each months of selected year
            let sql_incomes = `SELECT 
                        c.month_id as monthId,
                        m.month_name,
                        c.value,
                        c.customer,
                        CASE 
                            WHEN c.table_name = 'incomes' THEN 'income'
                            ELSE 'exit'
                        END AS type
                    FROM 
                        (
                            SELECT *, 'incomes' AS table_name FROM incomes
                            UNION ALL
                            SELECT *, 'exits' AS table_name FROM exits
                        ) AS c
                    JOIN years y ON c.year_id = y.id
                    JOIN months m ON c.month_id = m.id
                    WHERE y.year = ${item.year}
                    ORDER BY 
                        year_id, month_id DESC, customer;`;
            
            const results = await connection.execute(sql_incomes);
            
            results[0].forEach((item, index) => {
                
                let month_obj = {
                    month: item.month_name,
                    month_id: item.monthId,
                    incomes: [],
                    exits: []
                }

                // if inside the months property is empty or there is a corrispondance between the month_obj and current month cicled
                if(obj.months.length === 0 || !obj.months.find((elem) => elem.month === month_obj.month)){
                    if(item.type == 'income'){
                        month_obj.incomes.push({value: item.value, customer: item.customer})
                    }
                    else{
                        month_obj.exits.push({value: item.value, customer: item.customer})
                    }
                }
                // else if the months property has already same month elem 
                else if(obj.months.find((elem) => elem.month === month_obj.month)){
                    let elem = obj.months.find((elem) => elem.month === month_obj.month)
                   
                    if(item.type == 'income'){
                        elem.incomes.push({value: item.value, customer: item.customer});
                        month_obj.incomes = elem.incomes;
                        
                    }
                    else{
                        elem.exits.push({value: item.value, customer: item.customer});
                        month_obj.exits = elem.exits;
                    }
                    
                }
                
                if(!obj.months.find((el) => el.month === item.month_name)){
                    obj.months.push(month_obj);
                }
  
            })

            return obj
        });

        const values = await Promise.all(promises)
        
        return res.status(200).json({values: values})
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi. '+err
        });
        
    }
}

export const get_all = async (req, res, next) => {
    try{
        let sql = "SELECT * FROM years";
        const rows = await connection.execute(sql);
        if(!rows.length) return res.status(204).json({message: "Nessun anno trovato"});
        
        return res.status(200).json({years: rows[0]});
    }
    catch(err){
        res.status(500).json({
            message: err
        });
    }
};

export const store = async (data, res) => {
    
    try{
        const validation = validationResult(data);
        
        if(!validation.isEmpty()){
            
            return res.status(200).json({result: false, message: validation.errors[0].msg});
        }

        const year = data.body.year;
        const user_id = data.body.id;
        let today = getCurrentDate();
        
    
        await connection.execute(`INSERT INTO years (year, user_id, created_at, updated_at) VALUES (?,?, ?,?)`, [year, user_id, today, today]);
        return res.status(201).json({ result: true, message: 'Anno salvato correttamente'});
    }
    catch(err){
        console.log(err);
        res.status(500).json({
            message: err
        });
    }
}

export const delete_year = async (data, res) => {
    try{
        const year_id = data.body.year_id;

        let sql_delete = `DELETE FROM years WHERE id = ?`;
        await connection.execute(sql_delete, [year_id]);

        return res.status(201).json({ result: true, message: "Anno cancellato correttamente"});
    }
    catch(err){
        res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi.'+err
        })
    }
}

function getCurrentDate(){
    let today = new Date();
    
    today = today.getUTCFullYear() + '-' +
    ('00' + (today.getUTCMonth()+1)).slice(-2) + '-' +
    ('00' + today.getUTCDate()).slice(-2) + ' ' + 
    ('00' + today.getUTCHours()).slice(-2) + ':' + 
    ('00' + today.getUTCMinutes()).slice(-2) + ':' + 
    ('00' + today.getUTCSeconds()).slice(-2);

    return today;
}