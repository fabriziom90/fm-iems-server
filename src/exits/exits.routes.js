import express from "express";
import { check } from 'express-validator';

import {
    store,
    update,
    delete_exit,
    get_all,
    get_distinct_exits
} from "./exits.controller.js"

const router = express.Router();

router.get('/', get_all);
router.get('/get_distinct_exits', get_distinct_exits)
router.post("/store", [
    check('year').notEmpty().withMessage('Devi selezionare prima l\'anno'), 
    check('month').notEmpty().withMessage('Devi selezionare prima il mese'), 
    check('amount').notEmpty().withMessage('Devi inserire l\'importo'), 
    check('amount').isNumeric().withMessage('L\'importo deve essere numerico'), 
    check('customer').notEmpty().withMessage('Devi inserire prima la fonte dell\'entrata'), 
    check('customer').trim().isString().withMessage('Il cliente deve essere una stringa')
], store);
router.put('/update', [
    check('value').notEmpty().withMessage('Devi inserire un valore di importo per l\'entrata'),
    check('value').isNumeric().withMessage('Devi inserire un valore numerico per l\'importo'),
    check('customer').notEmpty().withMessage('Devi inserire un valore per il cliente')
], update);
router.delete('/delete', delete_exit);


export default router;