-- Creation script for ChartsSourceOfTruth additions for the Procedures CriticalCare section options
DO $$
DECLARE
    chart_code TEXT;
    elem RECORD;
BEGIN
    -- Outer loop: for each chart code
    FOR chart_code IN
        SELECT * FROM (VALUES
            ('T001x'),('T002x'),('T003x'),
            ('T006x'),('T007x'),('T008x'),
            ('T009x'),('T010x'),('T011x'),
            ('T012x'),('T013x'),('T015x'),
            ('T024x'),('T025x'),('T028x'),
            ('T029x'),('T030x'),('T031x'),
            ('T032x'),('T033x'),('T035x'),
            ('T036x'),('T039x'),('T040x'),
            ('T042x'),('T051x'),('T057x'),
            ('T058x'),('T070a')
        ) AS t(chart_code)
    LOOP
        FOR elem IN
            SELECT 
                answer_code::TEXT, 
                type::TEXT, 
                label::TEXT
            FROM (
                VALUES
                    ('Q003', 'subsection-title', ''),
                    ('cprResuscitationSwitch', 'switch', ''),
                    ('Q003A001', 'date', ''),
                    ('Q003A002', 'date', ''),
                    ('Q003A003', 'option', 'respiratory'),
                    ('Q003A004', 'option', 'cardiac'),
                    ('Q003A005', 'option', 'other'),
                    ('Q003A006', 'input', ''),
                    ('Q003A007', 'option', 'ventricular fibrillation'),
                    ('Q003A008', 'option', 'PEA'),
                    ('Q003A009', 'option', 'ventricular tachycardia'),
                    ('Q003A010', 'option', 'other'),
                    ('Q003A011', 'input', ''),
                    ('Q003A012', 'option', 'name:'),
                    ('Q003A013', 'input', ''),
                    ('Q003A014', 'option', 'time:'),
                    ('Q003A015', 'date', ''),
                    ('Q003A016', 'input', ''),
                    ('Q003A017', 'option', 'by:'),
                    ('Q003A018', 'input', ''),
                    ('Q003A019', 'option', 'size:'),
                    ('Q003A020', 'input', ''),
                    ('Q003A021', 'option', 'time:'),
                    ('Q003A022', 'date', ''),
                    ('Q003A023', 'input', ''),
                    ('Q003A024', 'option', 'breath sounds checked by:'),
                    ('Q003A025', 'input', ''),
                    ('Q003A026', 'input', ''),
                    ('Q003A027', 'option', 'x-ray done'),
                    ('Q003A028', 'option', 'confirmed placement'),
                    ('Q003A029', 'input', ''),
                    ('Q003A030', 'date', ''),
                    ('Q003A031', 'option', 'mouth to mask'),
                    ('Q003A032', 'input', ''),
                    ('Q003A033', 'date', ''),
                    ('Q003A034', 'option', 'airway'),
                    ('Q003A035', 'input', ''),
                    ('Q003A036', 'date', ''),
                    ('Q003A037', 'option', 'oxygen @'),
                    ('Q003A038', 'input', ''),
                    ('Q003A039', 'option', 'liters'),
                    ('Q003A040', 'input', ''),
                    ('Q003A041', 'date', ''),
                    ('Q003A042', 'option', 'ambu to mask'),
                    ('Q003A043', 'input', ''),
                    ('Q003A044', 'date', ''),
                    ('Q003A045', 'option', 'ambu to ET'),
                    ('Q003A046', 'input', ''),
                    ('Q003A047', 'date', ''),
                    ('Q003A048', 'option', 'E.T. CO2'),
                    ('Q003A049', 'input', ''),
                    ('Q003A050', 'date', ''), 
                    ('Q003A051', 'option', 'vent settings'),
                    ('Q003A052', 'input', ''),
                    ('Q003A053', 'date', ''),
                    ('Q003A054', 'option', 'FiO2'),
                    ('Q003A055', 'input', ''),
                    ('Q003A056', 'option', 'tidal vol.'),
                    ('Q003A057', 'input', ''),
                    ('Q003A058', 'option', 'Rate'),
                    ('Q003A059', 'input', ''),
                    ('Q003A060', 'input', ''),
                    ('Q003A061', 'date', ''),
                    ('Q003A062', 'option', 'Rhythm'),
                    ('Q003A063', 'input', ''),
                    ('Q003A064', 'option', 'Joules'),
                    ('Q003A065', 'input', ''),
                    ('Q003A066', 'option', 'Response'),
                    ('Q003A067', 'input', ''),
                    ('Q003A068', 'date', ''),
                    ('Q003A069', 'option', 'Rhythm'),
                    ('Q003A070', 'input', ''),
                    ('Q003A071', 'option', 'Joules'),
                    ('Q003A072', 'input', ''),
                    ('Q003A073', 'option', 'Response'),
                    ('Q003A074', 'input', ''),
                    ('Q003A075', 'date', ''),
                    ('Q003A076', 'option', 'Rhythm'),
                    ('Q003A077', 'input', ''),
                    ('Q003A078', 'option', 'Joules'),
                    ('Q003A079', 'input', ''),
                    ('Q003A080', 'option', 'Response'),
                    ('Q003A081', 'input', ''),
                    ('Q003A082', 'date', ''),
                    ('Q003A083', 'input', ''),
                    ('Q003A084', 'input', ''),
                    ('Q003A085', 'option', 'time arrived:'),
                    ('Q003A086', 'date', ''),
                    ('Q003A087', 'input', ''),
                    ('Q003A088', 'input', ''),
                    ('Q003A089', 'option', 'time arrived:'),
                    ('Q003A090', 'date', ''),
                    ('Q003A091', 'input', ''),
                    ('Q003A092', 'input', ''),
                    ('Q003A093', 'option', 'time arrived:'),
                    ('Q003A094', 'date', ''),
                    ('Q003A095', 'input', ''),
                    ('Q003A096', 'input', ''),
                    ('Q003A097', 'option', 'time arrived:'),
                    ('Q003A098', 'date', ''),
                    ('Q003A099', 'input', ''),
                    ('Q003A100', 'input', ''),
                    ('Q003A101', 'option', 'time arrived:'),
                    ('Q003A102', 'date', ''),
                    ('Q003A103', 'input', ''),
                    ('Q003A104', 'input', ''),
                    ('Q003A105', 'option', 'time arrived:'),
                    ('Q003A106', 'date', ''),
                    ('Q003A107', 'input', ''),
                    ('Q003A108', 'input', ''),
                    ('Q003A109', 'option', 'time arrived:'),
                    ('Q003A110', 'date', '')
            ) AS e(answer_code, type, label)
        LOOP
            IF NOT EXISTS (
                SELECT 1 FROM public."ChartsSourceOfTruth"
                WHERE "ChartCode" = chart_code 
                AND "AnswerCode" = elem.answer_code 
                AND "ChartSectionId" = 'SPRO'
                AND "ChartType" = 'Triage'
            ) THEN
                INSERT INTO public."ChartsSourceOfTruth" (
                    "Id", "ChartCode", "ChartSectionId", "ChartType", "AnswerCode", 
                    "Label", "Value", "Type", "CreatedAt", "CreatedBy", 
                    "UpdatedAt", "UpdatedBy", "Deleted", "DeletedAt", "DeletedBy"
                ) VALUES (
                    gen_random_uuid(),
                    chart_code,
                    'SPRO',
                    'Triage',
                    elem.answer_code,
                    elem.label,
                    NULL,
                    elem.type,
                    NOW(), NULL,
                    NOW(), NULL,
                    false, NULL, NULL
                );
            END IF;
        END LOOP;
    END LOOP;
END $$;