-- Rollback script for AuditReview column additions (EN-2691)
ALTER TABLE public."ProgressNotes" DROP COLUMN IF EXISTS "TransferredToType";
