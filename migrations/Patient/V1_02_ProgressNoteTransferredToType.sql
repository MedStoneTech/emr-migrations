-- # Created At: 06-06-2025
-- # Description: The following columns will be used for storing the review value of a section and subsection
-- # Related to: EN-2748 EN-2747

DO $$
BEGIN
    IF EXISTS (SELECT FROM pg_tables WHERE tablename = 'ProgressNotes') THEN
        ALTER TABLE public."ProgressNotes" ADD COLUMN IF NOT EXISTS "TransferredToType" int4 NULL DEFAULT NULL;
    END IF;
END $$;