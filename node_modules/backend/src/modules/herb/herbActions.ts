import { RequestHandler } from "express";
import herbRepository from "./herbRepository";
import  { StatusCodes } from "http-status-codes";
import { error } from "console";
const browse: RequestHandler = async (req, res, next) => {
    try {
        const herb = await herbRepository.displayAllHerbs();
        res.json(herb)
    } catch (err) {
        next(err);
    }
};

const browsById: RequestHandler = async (req, res, next) => {
    try {
        const herb = await herbRepository.findById(Number(req.params.id),);
        if (!herb || herb.length === 0) {
            res.status(StatusCodes.NOT_FOUND).json ({ error: "No herb found"})
        } else {
            res.status(StatusCodes.OK).json(herb);
        }
    } catch(err) {
        next(err)
    }
};

export default {browse, browsById}