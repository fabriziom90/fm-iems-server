import { connection } from "../db/connect.js";
import { validationResult} from 'express-validator';

export const get_all = async (data,res) => {
    try{
        let sql_year = `SELECT DISTINCT years.year, years.id, years.user_id FROM years WHERE years.user_id = ${data.query.id} ORDER BY years.year DESC`;

        const results = await connection.execute(sql_year);
        
        const promises = results[0].map(async (item) => {
            
            let obj = {
                year: item.year,
                year_id: item.id,
                months: [null, null, null, null, null, null, null, null, null, null, null, null]
            }

            let sql = `SELECT SUM(value) as monthValue, months.id as month FROM exits JOIN months ON months.id = exits.month_id JOIN years ON years.id = exits.year_id WHERE years.year = '${item.year}' AND exits.user_id = ${data.query.id}  GROUP BY months.id ORDER BY years.year DESC`;
            
            const results = await connection.execute(sql);
            

            for(let i = 0; i<results[0].length; i++){
                let month = results[0][i]
                obj.months[month.month - 1] = month.monthValue;
            }
            
            return obj
        });
        
        const exits = await Promise.all(promises);
        
        return res.status(200).json({exits: exits})
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi. '+err
        });
    }
}

export const get_distinct_exits = async (data, res) => {
    try{
        
        const sql_year = `SELECT years.year FROM years WHERE year = ${data.query.year}`;
    
        const result = await connection.execute(sql_year);

        const promises = result[0].map(async (item) => {
            let obj = {
                year: item.year,
                months: []
            }

            let sql_exits = `SELECT exits.id as exitId, exits.value, exits.customer, months.id as monthId, months.month_name, years.id as yearId, years.year FROM exits  JOIN months ON months.id = exits.month_id JOIN years ON years.id = exits.year_id WHERE years.year = ${item.year} AND exits.user_id = ${data.query.id}  ORDER BY months.id DESC`;

            const results = await connection.execute(sql_exits);

            results[0].forEach((item, index) => {
                
                let month_obj = {
                    month: item.month_name,
                    month_id: item.monthId,
                    exits: []
                }
                
                if(obj.months.length === 0 || !obj.months.find((elem) => elem.month === month_obj.month)){
                    month_obj.exits.push({exit_id: item.exitId, value: item.value, month: item.month_name, customer: item.customer})
                    obj.months.push(month_obj);
                }
                else if(obj.months.find((elem) => elem.month === month_obj.month)){
                    let elem = obj.months.find((elem) => elem.month === month_obj.month)
                    elem.exits.push({exit_id: item.exitId, value: item.value, month: item.month_name, customer: item.customer});
                    month_obj.exits = elem.exits;
                    
                }
  
            })
            
            return obj
        });

        const exits = await Promise.all(promises)
        
        return res.status(200).json({exits: exits})
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi. '+err
        });
        
    }
    
}

export const store = async (data, res) => {
    try{
       
        const validations = validationResult(data);
        
        if(!validations.isEmpty()){
            return res.status(200).json({result: false, message: validations.errors[0].msg});
        }
        
        const { year, month, amount, customer, user } = data.body;
       
        
        let today = getCurrentDate();

        let sql = `INSERT INTO exits (user_id, year_id, month_id, value, customer, created_at, updated_at) VALUES (?,?,?,?,?,?,?)`;
        await connection.execute(sql, [user.userId, year, month, amount, customer, today, today]);
        return res.status(201).json({ result: true, message: 'Uscita salvata correttamente'});
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi. '+err
        });
        
    }
    
}

export const update = async ( data, res) => {
    
    try{
        const validations = validationResult(data);
        
        if(!validations.isEmpty()){
            return res.status(200).json({result: false, message: validations.errors[0].msg});
        }

        let { exit_id, value, customer} = data.body;
        
        let sql_update = `UPDATE exits SET value = ?, customer = ? WHERE id = ?`;

        await connection.execute(sql_update, [value, customer, exit_id]);

        return res.status(201).json({result: true, message: "Entrata modificata correttamente"})
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi. '+err
        })
    }
}

export const delete_exit = async ( data, res ) => {
    try{
        const exit_id = data.body.exit_id;

        let sql_delete = `DELETE FROM exits WHERE id = ?`;
        await connection.execute(sql_delete, [exit_id]);

        return res.status(201).json({ result: true, message: "Entrata cancellata correttamente"});
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi.'+err
        });
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

