import databaseClient from "../../db"
import type { RowDataPacket } from "mysql2";

type Herb = RowDataPacket & {
  id: number;
  name: string;
  description: string;
  image1: string;
};

class herbRepository {
    async displayAllHerbs() {
        const [rows] = await databaseClient.query<Herb[]>(
            'SELECT * FROM ingredients'
        )
        return rows;
    }

    async findById(id: number) {
        const [rows] = await databaseClient.query<Herb[]>(
            'SELECT * FROM ingredients WHERE ingredients.id = ?;', [id]
        )
        return rows[0] ?? null;
    }
}

export default new herbRepository();