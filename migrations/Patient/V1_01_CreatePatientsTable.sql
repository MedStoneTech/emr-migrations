-- V1_01_CreatePatientsTable.sql
-- Create patients table if it doesn't exist

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'patients'
    ) THEN
        CREATE TABLE patients (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            first_name VARCHAR(100) NOT NULL,
            last_name VARCHAR(100) NOT NULL,
            date_of_birth DATE NOT NULL,
            gender VARCHAR(20),
            email VARCHAR(255) UNIQUE,
            phone VARCHAR(50),
            address TEXT,
            insurance_id VARCHAR(100),
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
        );
        
        -- Create indexes for frequent searches
        CREATE INDEX idx_patients_name ON patients(last_name, first_name);
        CREATE INDEX idx_patients_dob ON patients(date_of_birth);
        CREATE INDEX idx_patients_insurance ON patients(insurance_id);
        
        -- Comment the table and columns
        COMMENT ON TABLE patients IS 'Stores basic patient information';
        COMMENT ON COLUMN patients.id IS 'Unique patient identifier';
        COMMENT ON COLUMN patients.gender IS 'Patient gender (Male, Female, Non-binary, etc)';
    END IF;
END $$;