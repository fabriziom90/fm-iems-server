import { connection } from "../db/connect.js";
import { validationResult} from 'express-validator';

import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

export const register = async (data, res) =>{
    try{
        
        const validations = validationResult(data);

        if(!validations.isEmpty()){
            
            return res.status(200).json({result: false, message: validations.errors[0].msg});
        }

        const {name, email, password} = data.body;
        
        let today = getCurrentDate();
        
        let sql = "INSERT INTO users (name, email, password, created_at, updated_at) VALUES (?,?,?,?,?)";
        await connection.execute(sql, [name, email, password, today, today]);

        let user_sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        const result = await connection.execute(user_sql, [email, password]);

        let user = result[0][0];

        data.session.user = {
            userId: user.id,
            user_name: user.name
        };

        data.session.save();

        const id = user.id;

        const token = jwt.sign({id}, "jwtSecret", { expiresIn: 300});
        
        return res.status(201).json({ auth: true, token: token, result: true, message: "Registrazione effettuata. A breve verrai reindirizzato alla tua dashboard"});
        

    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: "Qualcosa è andato storto. Riprova più tardi. "+err
        })
    }
    
}

export const login = async (data, res) => {
    try{
        const validations = validationResult(data);

        if(!validations.isEmpty()){
            
            return res.status(200).json({result: false, message: validations.errors[0].msg});
        }

       
        const { email, password } = data.body;
        
        let query = "SELECT * FROM users WHERE email = ? ";
        
        const promise = await connection.execute(query, [email]);
        
        if(promise[0].length === 0){
            res.send({results: false, message: "Non esiste un utente registrato con questa email"})
        }

        promise[0].map( async (user) => {
            // CUSTOM MESSAGE FOR WRONG PASSWORD ONLY
            // const promise = new Promise(function(resolve, reject){
            //     bcrypt.compare(password, data.password, async (err, hash) => {
            //         if(err){
            //             reject(err)
            //         }

            //         resolve(hash);
            //     })
            // })
            
            // const succ = await Promise.all([promise]);
           
            // return succ[0];

            bcrypt.compare(password, user.password, async (err, hash) => {
                
                if(hash){
                    data.session.user = {
                        userId: user.id,
                        user_name: user.name,
                    };

                    data.session.save();
                    
                    const id = user.id;

                    const token = jwt.sign({id}, "jwtSecret", { expiresIn: 300});
                    
                    res.send({ auth: true, token: token, message: "Login effettuato. Verrai reindirizzato a breve alla tua dashboard"})
     
                }
                else{
                    res.send({auth: false, message: "La password per l'utente è errata"})
                }


            })
        });
        
    }
    catch(err){
        return res.status(500).json({
            result: false,
            message: "Qualcosa è andato storto. Riprova più tardi. "+err
        })
    }
}

export const checkLogin = (data, res) => {
    
    if(data.session.user){
        res.send({loggedIn: true, user: data.session.user});
    }
    else{
        res.send({loggedIn: false});
    }
}

export const getUserInfo = (data, res) => {
    
    if(data.session.user){
        
        res.status(200).json({ result: true, user: data.session.user});
    }
    else{
        res.status(200).json({ result: false, message: "Sessione scaduta. Verrai reindirizzato alla pagina di login"})
    }
}

export const isUserAuth = (data, res) => {
    res.send("Autenticazione effettuata");
}

export const verifyJWT = (data, res, next) => {
    const token = data.headers['x-access-token'];

    if(!token){
        res.send("Token non presente")
    }
    else{
        jwt.verify(token, "jwtSecret", (err, decoded) => {
            if(err){
                
                res.json({auth:false, message: "Autenticazione fallita"})
            }
            else{
                data.userId = decoded.id;
                next();
            }
        })
    }
}

export const logout = (data, res) => {
    if(data.session){
        data.session.destroy();
        res.status(200).json({ result: true, message: "Hai effettuato il logout. Torna presto!"})
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