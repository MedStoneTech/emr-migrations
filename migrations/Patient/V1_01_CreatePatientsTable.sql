-- V1_01_CreatePharmacyProductsTable.sql
-- Create pharmacy products table for medication inventory

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'pharmacy_products'
    ) THEN
        -- Create enum type for medication form if it doesn't exist
        IF NOT EXISTS (
            SELECT 1 FROM pg_type 
            WHERE typname = 'medication_form'
        ) THEN
            CREATE TYPE medication_form AS ENUM (
                'tablet', 'capsule', 'liquid', 'injection', 'topical', 
                'inhaler', 'patch', 'drops', 'suppository', 'powder'
            );
        END IF;

        CREATE TABLE pharmacy_products (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ndc_code VARCHAR(50) UNIQUE,  -- National Drug Code
            brand_name VARCHAR(255),
            generic_name VARCHAR(255) NOT NULL,
            manufacturer VARCHAR(255),
            form medication_form NOT NULL,
            strength VARCHAR(100) NOT NULL,  -- e.g., "50mg", "10mg/5ml"
            package_size VARCHAR(100),
            unit_price DECIMAL(10, 2) NOT NULL,
            requires_prescription BOOLEAN DEFAULT TRUE,
            in_stock INTEGER NOT NULL DEFAULT 0,
            reorder_level INTEGER NOT NULL DEFAULT 10,
            controlled_substance_class VARCHAR(10),  -- e.g., "II", "IV" or NULL
            storage_requirements TEXT,
            expiration_date DATE,
            last_ordered_date DATE,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
        );

        -- Create indexes for frequent searches
        CREATE INDEX idx_pharmacy_products_generic ON pharmacy_products(generic_name);
        CREATE INDEX idx_pharmacy_products_brand ON pharmacy_products(brand_name);
        CREATE INDEX idx_pharmacy_products_ndc ON pharmacy_products(ndc_code);
        CREATE INDEX idx_pharmacy_products_controlled ON pharmacy_products(controlled_substance_class) 
            WHERE controlled_substance_class IS NOT NULL;

        -- Add triggers for inventory tracking
        CREATE OR REPLACE FUNCTION update_product_timestamp()
        RETURNS TRIGGER AS $$
        BEGIN
            NEW.updated_at = CURRENT_TIMESTAMP;
            RETURN NEW;
        END;
        $$ LANGUAGE plpgsql;

        CREATE TRIGGER update_pharmacy_product_timestamp
        BEFORE UPDATE ON pharmacy_products
        FOR EACH ROW EXECUTE FUNCTION update_product_timestamp();

        -- Comments
        COMMENT ON TABLE pharmacy_products IS 'Inventory of all pharmacy medications and products';
        COMMENT ON COLUMN pharmacy_products.ndc_code IS 'FDA National Drug Code identifier';
        COMMENT ON COLUMN pharmacy_products.form IS 'Physical form of the medication (tablet, liquid, etc)';
        COMMENT ON COLUMN pharmacy_products.controlled_substance_class IS 'DEA schedule class for controlled substances';
        COMMENT ON COLUMN pharmacy_products.strength IS 'Dosage strength of the medication';
    END IF;
END $$;