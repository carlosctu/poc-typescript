import express from "express";
import moviesRouter from "./moviesRouter.js";
var router = express.Router();
router.use(moviesRouter);
export default router;
