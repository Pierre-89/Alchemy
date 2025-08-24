import express from "express";
import db, { testDb } from "./db.js";
import router from "./router";

const app = express();
app.use(express.json());
app.use("/api", router);  
app.listen(3000, async () => {
  await testDb();
  console.log("API sur http://localhost:3000");
});
