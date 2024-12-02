import { connection } from "../db/connect.js";

export const get_incomes = async (data, res) => {
    
    try{
        let sql_year = `SELECT years.year, years.id, years.user_id FROM years WHERE years.year = ${data.query.data} AND years.user_id = ${data.query.id}`;
        
        const result = await connection.execute(sql_year);
        
        const promises = result[0].map(async (item) => {
            let obj = {
                year: item.year,
                year_id: item.id,
                months: []
            }

            let sql = `SELECT 
                        i.month_id as monthId,
                        m.month_name,
                        i.value,
                        i.customer
                    FROM incomes i
                    JOIN years y ON i.year_id = y.id
                    JOIN months m ON i.month_id = m.id
                    WHERE y.year = ${item.year}
                    ORDER BY 
                        year_id, month_id DESC, customer`;
            
            const results = await connection.execute(sql);
            

            for(let i = 0; i<results[0].length; i++){
                let item = results[0][i];

                let month_obj = {
                    month: item.month_name,
                    month_id: item.monthId,
                    incomes: [],
                }

                let month = results[0][i];
               
                let income = month.value;
                let taxes = month.value * 0.3;
                let net = Math.round(month.value * 0.7, 2);

                if(obj.months.length === 0 || !obj.months.find((elem) => elem.month === month_obj.month)){
                    
                    month_obj.incomes.push({income: income, taxes: taxes, net: net, customer: item.customer})
                    
                }
                else if(obj.months.find((elem) => elem.month === month_obj.month)){
                    let elem = obj.months.find((elem) => elem.month === month_obj.month)
            
                    elem.incomes.push({income: income, taxes: taxes, net: net, customer: item.customer});
                    month_obj.incomes = elem.incomes;
                        
                }
                
                if(!obj.months.find((el) => el.month === item.month_name)){
                    obj.months.push(month_obj);
                }
                
              
            }
            
            return obj
        });

        const net_amounts = await Promise.all(promises);
        
        return res.status(200).json({net_amounts: net_amounts})
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: 'Qualcosa è andato storto. Riprova più tardi. '+err
        });
    }
}