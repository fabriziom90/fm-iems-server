

import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import session from "express-session";

import summaryRoute from './src/summary/summary.routes.js';
import yearsRoute from "./src/years/years.routes.js";
import monthsRoute from "./src/months/months.routes.js";
import incomesRoute from "./src/incomes/incomes.routes.js";
import exitsRoute from "./src/exits/exits.routes.js";
import taxesRoute from "./src/taxes/taxes.routes.js";
import usersRoute from "./src/users/users.routes.js";


dotenv.config();

const app = express();
const port = process.env.SERVER_PORT || 3000;

// inizializzazione della sessione
app.use(
    session({
        key: "userId",
        secret: "login-user",
        resave: false,
        saveUninitialized: false,
        cookie: {
            maxAge: 60 * 60 * 24 * 1000,
            
        }
    })    
)

const corsOptions = {
    origin: "http://localhost:5173", 
    optionsSuccessStatus: 200,
    credentials: true
}

// middlewares
app.use(cors(corsOptions));

// middleware che effettua il parsing dei dati JSON dal body della richiesta e li rende disponibili nell'oggetto req.body
app.use(express.json());

app.use(cookieParser());
app.use(bodyParser.urlencoded({extended: true}));


// rotte api
app.use('/years', yearsRoute);
app.use('/months', monthsRoute);
app.use('/incomes', incomesRoute);
app.use('/exits', exitsRoute);
app.use('/summary', summaryRoute);
app.use('/taxes', taxesRoute);
app.use('/users', usersRoute);

app.listen(port, () =>{
    console.log(`Applicazione in ascolto alla porta ${port}`)
    
});