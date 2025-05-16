-- Check if the table doesn't already exist
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT FROM pg_tables WHERE tablename = 'medicines') THEN
        CREATE TABLE medicines (
            id SERIAL PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            concentration VARCHAR(50),
            manufacturer VARCHAR(100),
            price DECIMAL(10,2) NOT NULL,
            stock INTEGER DEFAULT 0,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );

        -- Create index on commonly searched fields
        CREATE INDEX medicines_name ON medicines(name);
    END IF;
END $$;