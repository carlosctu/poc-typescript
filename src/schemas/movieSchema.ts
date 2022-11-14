import joi from "joi";

export const movieSchema = {
  insertMovie: joi.object({
    name: joi.string().required(),
    genre: joi.number().max(6).required(),
    platforms: joi.array().items(joi.number().required()).required(),
  }),
  updateMovie: joi.object({
    name: joi.string().required(),
    genre: joi.number().max(6).required(),
  }),
};
