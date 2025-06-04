-- # Created At: 03-06-2025
-- # Description: Insert queries for ChartsSourceOfTruth radiology subsection titles
-- # Related to: EN-2749

-- FRACTURES (F001-F022)
INSERT INTO public."ChartsSourceOfTruth" (
    "Id", "ChartCode", "ChartSectionId", "ChartType", "AnswerCode", 
    "Label", "Value", "Type", "CreatedAt", "CreatedBy", "UpdatedAt", 
    "UpdatedBy", "Deleted", "DeletedAt", "DeletedBy"
) VALUES 
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F001', 'Ankle', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F002', 'C1', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F003', 'C2', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F004', 'CTLS', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F005', 'Carpal', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F006', 'Clavicle', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F007', 'Facial', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F008', 'Femur', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F009', 'Fibula', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F010', 'Foot', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F011', 'Metacarpal', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F012', 'Patella', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F013', 'Pelvic', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F014', 'Phalanx', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F015', 'Radius', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F016', 'Sacrum', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F017', 'Scapula', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F018', 'Skull', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F019', 'Tibia', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F020', 'Rib', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F021', 'Sternum', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'F022', 'Ulna', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL)
ON CONFLICT ("AnswerCode") DO NOTHING;

-- DISLOCATIONS (D001-D015)
INSERT INTO public."ChartsSourceOfTruth" (
    "Id", "ChartCode", "ChartSectionId", "ChartType", "AnswerCode", 
    "Label", "Value", "Type", "CreatedAt", "CreatedBy", "UpdatedAt", 
    "UpdatedBy", "Deleted", "DeletedAt", "DeletedBy"
) VALUES 
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D001', 'AC Joint', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D002', 'Ankle', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D003', 'DIP', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D004', 'Elbow', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D005', 'Hip', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D006', 'Knee', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', ƒ'Any', 'D007', 'MCP', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D008', 'PIP', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D009', 'Shoulder', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D010', 'Patella', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D011', 'SC Joint', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D012', 'TMJ', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D013', 'Wrist', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D014', 'CMC', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL),
(gen_random_uuid(), 'SHARED', 'SRAD', 'Any', 'D015', 'TMT', NULL, 'subsection-title', NOW(), NULL, NOW(), NULL, false, NULL, NULL)
ON CONFLICT ("AnswerCode") DO NOTHING;