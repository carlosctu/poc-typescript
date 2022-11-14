import express from "express";
import * as MoviesController from "../controllers/moviesController.js";
var moviesRouter = express.Router();
moviesRouter.get("/movies", MoviesController.listAll);
moviesRouter.post("/movies", MoviesController.insertUnique);
moviesRouter.put("/movies/:id", MoviesController.updateUnique);
moviesRouter["delete"]("/movies/:id", MoviesController.deleteUnique);
moviesRouter.post("/movies/watch/:id");
//moviesRouter.get("/movies/genre=id", (res: Response, req: Request) => {
//return console.log("oi");
//});
export default moviesRouter;
