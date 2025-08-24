import express from "express";
import herbActions from "./modules/herb/herbActions";
import recipesActions from "./modules/recipes/recipesActions";

const router = express.Router();

router.get("/herb", herbActions.browse)
router.get("/herb/:id", herbActions.browsById)
router.get("/recipes", recipesActions.browse)

export default router;