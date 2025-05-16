-- Rollback script for pills table
DROP TABLE IF EXISTS pills CASCADE;
DROP INDEX IF EXISTS idx_pills_name;