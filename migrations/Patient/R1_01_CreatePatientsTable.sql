-- R1_01_CreatePharmacyProductsTable.sql
-- Remove pharmacy products table and related objects

DO $$
BEGIN
    -- Drop the table if it exists
    IF EXISTS (
        SELECT 1 FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'pharmacy_products'
    ) THEN
        -- Drop triggers first
        DROP TRIGGER IF EXISTS update_pharmacy_product_timestamp ON pharmacy_products;
        
        -- Drop indexes
        DROP INDEX IF EXISTS idx_pharmacy_products_generic;
        DROP INDEX IF EXISTS idx_pharmacy_products_brand;
        DROP INDEX IF EXISTS idx_pharmacy_products_ndc;
        DROP INDEX IF EXISTS idx_pharmacy_products_controlled;
        
        -- Drop table
        DROP TABLE pharmacy_products CASCADE;
    END IF;
    
    -- Drop the function
    DROP FUNCTION IF EXISTS update_product_timestamp();
    
    -- Drop the enum type if no other tables are using it
    -- We need to check if any column is using this type
    IF NOT EXISTS (
        SELECT 1 FROM pg_catalog.pg_type t 
        JOIN pg_catalog.pg_class c ON (c.reltype = t.oid) 
        JOIN pg_catalog.pg_attribute a ON (a.attrelid = c.oid) 
        JOIN pg_catalog.pg_type at ON (a.atttypid = at.oid)
        WHERE at.typname = 'medication_form'
        AND t.typname != 'medication_form'
    ) THEN
        DROP TYPE IF EXISTS medication_form;
    END IF;
END $$;