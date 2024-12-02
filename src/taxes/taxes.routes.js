import express from "express";

import {
    get_incomes
} from "./taxes.controller.js"

const router = express.Router();

router.get('/detail', get_incomes);

export default router;