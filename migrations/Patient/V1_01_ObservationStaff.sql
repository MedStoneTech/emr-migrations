DO $$
BEGIN
    -- Add ObservationSupervisorId if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'Encounters' 
        AND column_name = 'ObservationSupervisorId'
    ) THEN
        ALTER TABLE public."Encounters" ADD COLUMN "ObservationSupervisorId" uuid NULL;
    END IF;

    -- Add ObservationChargeNurseId if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'Encounters' 
        AND column_name = 'ObservationChargeNurseId'
    ) THEN
        ALTER TABLE public."Encounters" ADD COLUMN "ObservationChargeNurseId" uuid NULL;
    END IF;

    -- Add ObservationScribeId if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'Encounters' 
        AND column_name = 'ObservationScribeId'
    ) THEN
        ALTER TABLE public."Encounters" ADD COLUMN "ObservationScribeId" uuid NULL;
    END IF;

    -- Add ObservationClinicalSupportId if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'Encounters' 
        AND column_name = 'ObservationClinicalSupportId'
    ) THEN
        ALTER TABLE public."Encounters" ADD COLUMN "ObservationClinicalSupportId" uuid NULL;
    END IF;
END $$;