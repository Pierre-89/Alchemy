import databaseClient from "../../db"
import type { RowDataPacket } from "mysql2";

type Recipes = RowDataPacket & {
  id: number;
  name: string;
  description: string;
  image1: string;
};

class recipesRepository {
    async displayAllRecipes() {
        const [rows] = await databaseClient.query<Recipes[]>(
            `SELECT 
  r.id AS recipe_id,
  p.id AS potion_id,
  p.name AS potion_name,
  p.description AS potion_description,
  p.image1 AS potion_image,         
  i1.id AS ingredient1_id,
  i1.name AS ingredient1_name,
  i2.id AS ingredient2_id,
  i2.name AS ingredient2_name
FROM recipes r
JOIN potions p ON r.potion_id = p.id
JOIN ingredients i1 ON r.ingredient_1_id = i1.id
JOIN ingredients i2 ON r.ingredient_2_id = i2.id;

`
        )

        return rows;
    }
}

export default new recipesRepository();