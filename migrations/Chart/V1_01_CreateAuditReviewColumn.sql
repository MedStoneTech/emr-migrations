-- # Created At: 19-05-2025
-- # Description: The following columns will be used for storing the review value of a section and subsection
-- # Related to: EN-2691

DO $$
BEGIN
    IF EXISTS (SELECT FROM pg_tables WHERE tablename = 'ChartSections') THEN
        ALTER TABLE public."ChartSections" ADD COLUMN IF NOT EXISTS "AuditReview" bool NOT NULL DEFAULT false;
    END IF;

    IF EXISTS (SELECT FROM pg_tables WHERE tablename = 'ChartEncounterSections') THEN
        ALTER TABLE public."ChartEncounterSections" ADD COLUMN IF NOT EXISTS "AuditReview" bool NOT NULL DEFAULT false;
    END IF;

    IF EXISTS (SELECT FROM pg_tables WHERE tablename = 'ChartSubSections') THEN
        ALTER TABLE public."ChartSubSections" ADD COLUMN IF NOT EXISTS "AuditReview" bool NOT NULL DEFAULT false;
    END IF;

    IF EXISTS (SELECT FROM pg_tables WHERE tablename = 'ChartEncounterSubSections') THEN
        ALTER TABLE public."ChartEncounterSubSections" ADD COLUMN IF NOT EXISTS "AuditReview" bool NOT NULL DEFAULT false;
    END IF;
END $$;