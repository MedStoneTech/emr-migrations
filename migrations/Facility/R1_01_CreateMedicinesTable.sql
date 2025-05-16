-- Rollback script for medicine table
DROP TABLE IF EXISTS medicine CASCADE;
DROP INDEX IF EXISTS idx_medicine_name;