import { RequestHandler } from "express";
import recipesRepository from "./recipesRepository";

const browse: RequestHandler = async (req, res, next) => {
    try {
        const herb = await recipesRepository.displayAllRecipes();
        res.json(herb)
    } catch (err) {
        next(err);
    }
};

export default { browse }