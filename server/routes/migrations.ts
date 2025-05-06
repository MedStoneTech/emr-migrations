import express, { Request, Response } from "express";
import { ScanCommand } from "@aws-sdk/lib-dynamodb";

import { docClient } from "../index";
import {
  GetItemCommand,
  ReturnValue,
  UpdateItemCommand,
} from "@aws-sdk/client-dynamodb";

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

router.put(
  "/mark-as-executed/:id",
  async (req: Request, res: Response): Promise<void> => {
    try {
      const { id } = req.params;

      // First get the current state
      const getParams = {
        TableName: "migrations",
        Key: {
          id: { S: id },
        },
      };

      const getCommand = new GetItemCommand(getParams);
      const currentItem = await docClient.send(getCommand);

      if (!currentItem || !("Item" in currentItem)) {
        res.status(404).json({ error: "Migration not found" });
        return;
      }

      // Toggle the executed state
      const newExecutedState = !currentItem.Item!.executed;

      const updateParams = {
        TableName: "migrations",
        Key: {
          id: { S: id },
        },
        UpdateExpression: "SET executed = :executed",
        ExpressionAttributeValues: {
          ":executed": { BOOL: newExecutedState },
        },
        ReturnValues: ReturnValue.ALL_NEW,
      };

      const updateCommand = new UpdateItemCommand(updateParams);
      const result = await docClient.send(updateCommand);

      res.json({
        message: "Migration updated successfully",
        item: result.Attributes,
      });
    } catch (error) {
      console.error("Error updating migration:", error);
      res.status(500).json({ error: "Failed to update migration" });
    }
  }
);

export { router as migrationsRouter };
