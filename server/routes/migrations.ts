import express from "express";
import { ScanCommand } from "@aws-sdk/lib-dynamodb";
import { docClient } from "../index";

const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const limit = 35;
    const exclusiveStartKey = req.query.nextToken
      ? JSON.parse(decodeURIComponent(req.query.nextToken as string))
      : undefined;

    const params = {
      TableName: "migrations",
      Limit: limit,
      ExclusiveStartKey: exclusiveStartKey,
    };

    const command = new ScanCommand(params);
    const result = await docClient.send(command);

    res.json({
      items: result.Items,
      count: result.Count,
      nextToken: result.LastEvaluatedKey
        ? encodeURIComponent(JSON.stringify(result.LastEvaluatedKey))
        : null,
    });
  } catch (error) {
    console.error("Error fetching migrations:", error);
    res.status(500).json({ error: "Failed to fetch migrations" });
  }
});

export { router as migrationsRouter };
