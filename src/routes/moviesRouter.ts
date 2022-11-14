import express from "express";
import * as MoviesController from "../controllers/moviesController.js";

const moviesRouter = express.Router();

moviesRouter.get("/movies", MoviesController.listAll);
moviesRouter.post("/movies", MoviesController.insertUnique);
moviesRouter.put("/movies/:id", MoviesController.updateUnique);
moviesRouter.delete("/movies/:id", MoviesController.deleteUnique);
moviesRouter.post("/movies/watch/:id");
moviesRouter.get("/movies/platform/:id", MoviesController.listMoviesByPlatform);

export default moviesRouter;
