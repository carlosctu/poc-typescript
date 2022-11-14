import {
  MovieEntity,
  MoviePlatformEntity,
  Movie,
} from "./../protocols/moviesProtocol.js";
import connection from "../database/db.js";
import { QueryResult } from "pg";

//CREATE
async function insertMovie(movie: Movie): Promise<QueryResult<MovieEntity>> {
  return connection.query(
    `INSERT INTO movies (name, genre, platforms)
    VALUES($1, $2, $3) RETURNING id;`,
    [movie.name, movie.genre, movie.platforms]
  );
}

//READ
async function getAllMovies(): Promise<QueryResult<MovieEntity>> {
  return connection.query(`
    SELECT m.id, m.name, g.id as "genreId", g.name as "genre", p.id as "platformId", p.name as "platform", m.created_at
    FROM movie_platforms mp
    RIGHT JOIN movies m ON m.id = mp.movie_id
    INNER JOIN platforms p ON p.id = mp.platform_id
    LEFT JOIN genres g ON g.id = m.genre
    GROUP BY m.id, p.id, p.name, g.id, g.name
    ORDER BY m.id;`);
}

//UPDATE
async function updateMovie(
  id: number,
  movie: Movie
): Promise<QueryResult<MovieEntity>> {
  return connection.query(
    `UPDATE movies SET name = $1, genre = $2 WHERE id = $3;`,
    [movie.name, movie.genre, id]
  );
}

//DELETE
async function deleteMovie(id: number): Promise<QueryResult<MovieEntity>> {
  return connection.query(`DELETE FROM movies WHERE id = $1;`, [id]);
}

async function deleteMoviesOnPlatforms(
  id: number
): Promise<QueryResult<MovieEntity>> {
  return connection.query(`DELETE FROM movie_platforms WHERE movie_id = $1;`, [id]);
}

async function addMovieIntoPlatform(
  movie_id: number,
  platform_id: number
): Promise<QueryResult<MoviePlatformEntity>> {
  return connection.query(
    `INSERT INTO movie_platforms (movie_id, platform_id) VALUES ($1,$2);`,
    [movie_id, platform_id]
  );
}

async function getMoviesByStreamingPlatform(platformId: number) {
  return connection.query(
    ` SELECT m.id, m.name, g.id as "genreId", g.name as "genre", p.id as "platformId", p.name as "platform", m.created_at
    FROM movie_platforms mp
    RIGHT JOIN movies m ON m.id = mp.movie_id
    INNER JOIN platforms p ON p.id = mp.platform_id
    LEFT JOIN genres g ON g.id = m.genre
    WHERE p.id = $1
    GROUP BY m.id, p.id, p.name, g.id, g.name
    ORDER BY m.id;`,
    [platformId]
  );
}

export {
  insertMovie,
  getAllMovies,
  updateMovie,
  deleteMovie,
  deleteMoviesOnPlatforms,
  addMovieIntoPlatform,
  getMoviesByStreamingPlatform,
};
