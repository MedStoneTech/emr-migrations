import express from "express";
import dotenv from "dotenv";
import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient } from "@aws-sdk/lib-dynamodb";
import { migrationsRouter } from "./routes/migrations";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

const dynamoClient = new DynamoDBClient({
  region: process.env.AWS_REGION || "us-east-1",
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID || "",
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY || "",
  },
});

export const docClient = DynamoDBDocumentClient.from(dynamoClient);

app.use("/api/migrations", migrationsRouter);

app.listen(PORT, () => {
  console.log(`EMR Migrations server running on port ${PORT}`);
});
