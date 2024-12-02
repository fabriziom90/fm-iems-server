import express from "express";
import { check } from 'express-validator';

import {
    get_all,
    store,
    summary,
    delete_year
} from "./years.controller.js"

const router = express.Router();
router.get("/", get_all);
router.get('/summary', summary);
router.post("/store", [check('year').notEmpty().withMessage('Devi selezionare prima l\'anno')], store);
router.delete("/delete", delete_year);


export default router;