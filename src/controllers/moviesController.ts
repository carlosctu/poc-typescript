import { Movie } from "./../protocols/moviesProtocol";
import { Request, Response } from "express-serve-static-core";
import * as MoviesRepository from "../repositories/moviesRepository.js";
import { movieSchema } from "../schemas/movieSchema.js";

async function insertUnique(req: Request, res: Response) {
  const movie = req.body as Movie;
  const validation = movieSchema.insertMovie.validate(movie, {
    abortEarly: false,
  });

  if (validation.error) {
    const errors = validation.error.details.map((error) => error.message);
    res.status(422).send({ message: errors });
    return;
  }

  const newMovie = await MoviesRepository.insertMovie(movie);

  movie.platforms.map((platform) => {
    MoviesRepository.addMovieIntoPlatform(newMovie.rows[0].id, platform);
  });

  return res.sendStatus(201);
}

async function listAll(req: Request, res: Response) {
  const moviesList = await MoviesRepository.getAllMovies();

  return res.send({ Movies: moviesList.rows }).status(200);
}

async function updateUnique(req: Request, res: Response) {
  const { id } = req.params;
  const movie = req.body as Movie;
  const validation = movieSchema.updateMovie.validate(movie, {
    abortEarly: false,
  });

  if (validation.error) {
    const errors = validation.error.details.map((error) => error.message);
    res.status(422).send({ message: errors });
    return;
  }
  const updatedMovie = await MoviesRepository.updateMovie(parseInt(id), movie);

  if (updatedMovie.rowCount === 0)
    return res.status(404).send({ message: "Not found" });

  return res.sendStatus(201);
}

async function deleteUnique(req: Request, res: Response) {
  const { id } = req.params;

  const deletedMovie = await MoviesRepository.deleteMovie(parseInt(id));

  if (deletedMovie.rowCount === 0)
    return res.status(404).send({ message: "Not found" });

  return res.sendStatus(200);
}

async function listMoviesByPlatform(req: Request, res: Response) {
  const { id } = req.params;

  const filteredMovies = await MoviesRepository.getMoviesByStreamingPlatform(
    parseInt(id)
  );
  return res.status(200).send({ Movies: filteredMovies.rows });
}
export {
  insertUnique,
  listAll,
  updateUnique,
  deleteUnique,
  listMoviesByPlatform,
};
