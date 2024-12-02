import express from "express";

import {
    get_all
} from "./summary.controller.js"

const router = express.Router();

router.get('/', get_all);

export default router;