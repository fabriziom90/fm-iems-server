import express from "express";
import { connection } from "../db/connect.js";
import { check } from 'express-validator';

import {
    register,
    login,
    logout,
    checkLogin,
    verifyJWT,
    isUserAuth,
    getUserInfo
} from "./users.controller.js"

const router = express.Router();
router.post("/register", [
    check('name').notEmpty().trim().withMessage('Devi inserire prima il nome ed il cognome'),
    check('email').notEmpty().trim().withMessage('Devi inserire prima l\'indirizzo email'),
    check('email').isEmail().withMessage('L\'indirizzo email inserito non è valido'),
    check('email').custom( async (email) => {
        const results = await connection.query("SELECT COUNT(*) as checkUser FROM users WHERE email = ?", [email]);
        
        
        if(results[0][0].checkUser > 0){
            throw new Error('Email già in uso');
        }
    }).withMessage('Email già in uso'),
    check('password').notEmpty().trim().withMessage('Devi inserire prima la password'),
    check('password').isLength({ min: 5 }).withMessage('La password deve essere di almeno 5 caratteri'),
    check('confirmPassword').custom((value, { req }) => {
        return value === req.body.password;
    }).withMessage('Le password non coincidono')
], register);
router.post('/login',[
    check('email').notEmpty().trim().withMessage('Devi inserire prima l\'indirizzo email'),
    check('email').isEmail().withMessage('L\'indirizzo email inserito non è valido'),
    check('password').notEmpty().trim().withMessage('Devi inserire prima la password'),
    check('password').isLength({ min: 5 }).withMessage('La password deve essere di almeno 5 caratteri'),
], login);

router.get('/login', checkLogin);
router.get('/logout', logout);
router.get('/is-user-auth', verifyJWT, isUserAuth);
router.get('/get-user-info', getUserInfo);

export default router;