import express from "express";
import moviesRouter from "./moviesRouter.js";

const router = express.Router();
router.use(moviesRouter);

export default router;
