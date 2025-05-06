-- Rollback script for medicine table
DROP TABLE IF EXISTS medicines CASCADE;
DROP INDEX IF EXISTS idx_medicines_name;