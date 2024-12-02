import { connection } from "../db/connect.js";


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

            let sql_incomes = `SELECT SUM(value) as monthValue, months.id as month FROM incomes JOIN months ON months.id = incomes.month_id JOIN years ON years.id = incomes.year_id WHERE years.year = '${item.year}' AND incomes.user_id = ${ data.query.id } GROUP BY months.id ORDER BY years.year DESC`;
            
            const results_incomes = await connection.execute(sql_incomes);

            for(let i = 0; i<results_incomes[0].length; i++){
                let month = results_incomes[0][i]
                obj.months[month.month - 1] = month.monthValue * 0.7;
            }

            

            let sql_exits = `SELECT SUM(value) as monthValue, months.id as month FROM exits JOIN months ON months.id = exits.month_id JOIN years ON years.id = exits.year_id WHERE years.year = '${item.year}' AND exits.user_id = ${ data.query.id } GROUP BY months.id ORDER BY years.year DESC`;
            
            const results_exits = await connection.execute(sql_exits);
            
            for(let i = 0; i<results_exits[0].length; i++){
                let month = results_exits[0][i];
                
                if(obj.months[month.month - 1] != null){
                    obj.months[month.month - 1] -= month.monthValue;
                }
                else{
                    obj.months[month.month - 1] = 0 - month.monthValue;
                }
            }
            
            return obj
        });
        
        const values = await Promise.all(promises);
        
        return res.status(200).json({values: values})
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi. '+err
        });
    }
}