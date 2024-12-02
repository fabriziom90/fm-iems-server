import express from "express";
import {
    get_all,
    
} from "./months.controller.js"

const router = express.Router();
router.route("/").get(get_all);



export default router;