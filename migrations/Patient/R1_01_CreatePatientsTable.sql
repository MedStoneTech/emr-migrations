-- R1_01_CreatePatientsTable.sql
-- Remove the patients table and its dependencies

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'patients'
    ) THEN
        -- Drop indexes first (although DROP TABLE CASCADE would remove them)
        DROP INDEX IF EXISTS idx_patients_name;
        DROP INDEX IF EXISTS idx_patients_dob;
        DROP INDEX IF EXISTS idx_patients_insurance;
        
        -- Drop the table
        DROP TABLE patients CASCADE;
    END IF;
END $$;