import joi from "joi";
export var movieSchema = {
    insertMovie: joi.object({
        name: joi.string().required(),
        genre: joi.number().max(6).required(),
        platforms: joi.array().items(joi.number().min(1)).required()
    }),
    updateMovie: joi.object({
        name: joi.string().required(),
        genre: joi.number().max(6).required()
    })
};
