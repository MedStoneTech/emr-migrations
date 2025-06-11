-- # Created At: 03-06-2025
-- # Description: Rollback script for Radiology Shared Items Insert
-- # Related to: EN-2749

DELETE FROM public."ChartsSourceOfTruth"
WHERE "ChartCode" = 'SHARED'
  AND "ChartSectionId" = 'SRAD'
  AND "ChartType" = 'Any'
  AND "Type" = 'subsection-title'
  AND "AnswerCode" IN (
    -- FRACTURES (F001-F022)
    'F001', 'F002', 'F003', 'F004', 'F005', 'F006', 'F007', 'F008', 'F009', 'F010',
    'F011', 'F012', 'F013', 'F014', 'F015', 'F016', 'F017', 'F018', 'F019', 'F020',
    'F021', 'F022',
    -- DISLOCATIONS (D001-D015)
    'D001', 'D002', 'D003', 'D004', 'D005', 'D006', 'D007', 'D008', 'D009', 'D010',
    'D011', 'D012', 'D013', 'D014', 'D015'
  );