-- # Created At: 20-05-2025
-- # Description: Updates "Type" from 'option' to 'cross-option' in ChartsSourceOfTruth for specific ChartSectionIds
-- # Related to: EN-2704

DO $$
BEGIN
    IF EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = 'ChartsSourceOfTruth') THEN
        UPDATE public."ChartsSourceOfTruth"
        SET "Type" = 'cross-option'
        WHERE "Type" = 'option'
          AND "ChartType" = 'Provider'
          AND "ChartSectionId" IN ('SPRO2', 'SRAD', 'SDIS', 'SPSN2');
    END IF;
END $$ LANGUAGE plpgsql;