-- Rollback script for V1_01_UpdateSourceOfTruthProviderCharts
UPDATE public."ChartsSourceOfTruth"
SET "Type" = 'option'
WHERE "Type" = 'cross-option'
  AND "ChartType" = 'provider'
  AND "ChartSectionId" IN ('SPRO2', 'SRAD', 'SDIS', 'SPSN2');