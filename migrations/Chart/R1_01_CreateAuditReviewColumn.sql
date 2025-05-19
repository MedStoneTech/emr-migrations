-- Rollback script for AuditReview column additions (EN-2691)
ALTER TABLE public."ChartSections" DROP COLUMN IF EXISTS "AuditReview";
ALTER TABLE public."ChartEncounterSections" DROP COLUMN IF EXISTS "AuditReview";
ALTER TABLE public."ChartSubSections" DROP COLUMN IF EXISTS "AuditReview";
ALTER TABLE public."ChartEncounterSubSections" DROP COLUMN IF EXISTS "AuditReview";