DO $$
BEGIN
    -- Drop ObservationSupervisorId if it exists
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'Encounters' 
        AND column_name = 'ObservationSupervisorId'
    ) THEN
        ALTER TABLE public."Encounters" DROP COLUMN "ObservationSupervisorId";
    END IF;

    -- Drop ObservationChargeNurseId if it exists
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'Encounters' 
        AND column_name = 'ObservationChargeNurseId'
    ) THEN
        ALTER TABLE public."Encounters" DROP COLUMN "ObservationChargeNurseId";
    END IF;

    -- Drop ObservationScribeId if it exists
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'Encounters' 
        AND column_name = 'ObservationScribeId'
    ) THEN
        ALTER TABLE public."Encounters" DROP COLUMN "ObservationScribeId";
    END IF;

    -- Drop ObservationClinicalSupportId if it exists
    IF EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'Encounters' 
        AND column_name = 'ObservationClinicalSupportId'
    ) THEN
        ALTER TABLE public."Encounters" DROP COLUMN "ObservationClinicalSupportId";
    END IF;
END $$;