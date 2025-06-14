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
                    ('Q004', 'subsection-title', ''),
                    ('moderateSedationSwitch', 'switch', ''),
                    ('Q004A001', 'date', ''),
                    ('Q004A002', 'option', 'laceration'),
                    ('Q004A003', 'option', 'shoulder dislocation'),
                    ('Q004A004', 'option', 'I&D'),
                    ('Q004A005', 'option', 'radiology study'),
                    ('Q004A006', 'input', ''),
                    ('Q004A007', 'option', 'NKDA'),
                    ('Q004A008', 'option', 'PSN'),
                    ('Q004A009', 'option', 'ASA'),
                    ('Q004A010', 'option', 'sulfa'),
                    ('Q004A011', 'option', 'latex'),
                    ('Q004A012', 'input', ''),
                    ('Q004A013', 'option', 'patient or family history of adverse reactions to anesthesia'),
                    ('Q004A014', 'input', ''),
                    ('Q004A015', 'option', 'consent signed'),
                    ('Q004A016', 'option', 'last PO intake'),
                    ('Q004A017', 'input', ''),
                    ('Q004A018', 'option', 'H&P'),
                    ('Q004A019', 'option', 'meds'),
                    ('Q004A020', 'option', 'order documented'),
                    ('Q004A021', 'option', 'ID band'),
                    ('Q004A022', 'option', 'pt. education'),
                    ('Q004A023', 'input', ''),
                    ('Q004A024', 'option', 'input'),
                    ('Q004A025', 'option', 'pulse ox'),
                    ('Q004A026', 'option', 'suction'),
                    ('Q004A027', 'option', 'NIBP'),
                    ('Q004A028', 'option', 'cardiac monitor'),
                    ('Q004A029', 'option', 'emergency cart'),
                    ('Q004A030', 'input', ''),
                    ('Q004A031', 'option', 'O2'),
                    ('Q004A032', 'input', ''),
                    ('Q004A033', 'option', 'IV'),
                    ('Q004A034', 'input', ''),
                    ('Q004A035', 'input', ''),
                    ('Q004A036', 'option', 'equipment in constant attendance'),
                    ('Q004A037', 'input', ''),
                    ('Q004A038', 'input', ''),
                    ('Q004A039', 'option', '2'),
                    ('Q004A040', 'input', ''),
                    ('Q004A041', 'input', ''),
                    ('Q004A042', 'input', ''),
                    ('Q004A043', 'option', '1'),
                    ('Q004A044', 'input', ''),
                    ('Q004A045', 'input', ''),
                    ('Q004A046', 'input', ''),
                    ('Q004A047', 'option', '0'),
                    ('Q004A048', 'input', ''),
                    ('Q004A049', 'input', ''),
                    ('Q004A050', 'input', ''),
                    ('Q004A051', 'option', '2'),
                    ('Q004A052', 'input', ''),
                    ('Q004A053', 'input', ''),
                    ('Q004A054', 'input', ''),
                    ('Q004A055', 'option', '1'),
                    ('Q004A056', 'input', ''),
                    ('Q004A057', 'input', ''),
                    ('Q004A058', 'input', ''),
                    ('Q004A059', 'option', '0'),
                    ('Q004A060', 'input', ''),
                    ('Q004A061', 'input', ''),
                    ('Q004A062', 'input', ''),
                    ('Q004A063', 'option', '2'),
                    ('Q004A064', 'input', ''),
                    ('Q004A065', 'input', ''),
                    ('Q004A066', 'input', ''),
                    ('Q004A067', 'option', '1'),
                    ('Q004A068', 'input', ''),
                    ('Q004A069', 'input', ''),
                    ('Q004A070', 'input', ''),
                    ('Q004A071', 'option', '0'),
                    ('Q004A072', 'input', ''),
                    ('Q004A073', 'input', ''),
                    ('Q004A074', 'input', ''),
                    ('Q004A075', 'option', '2'),
                    ('Q004A076', 'input', ''),
                    ('Q004A077', 'input', ''),
                    ('Q004A078', 'input', ''),
                    ('Q004A079', 'option', '1'),
                    ('Q004A080', 'input', ''),
                    ('Q004A081', 'input', ''),
                    ('Q004A082', 'input', ''),
                    ('Q004A083', 'option', '0'),
                    ('Q004A084', 'input', ''),
                    ('Q004A085', 'input', ''),
                    ('Q004A086', 'input', ''),
                    ('Q004A087', 'option', '2'),
                    ('Q004A088', 'input', ''),
                    ('Q004A089', 'input', ''),
                    ('Q004A090', 'input', ''),
                    ('Q004A091', 'option', '1'),
                    ('Q004A092', 'input', ''),
                    ('Q004A093', 'input', ''),
                    ('Q004A094', 'input', ''),
                    ('Q004A095', 'option', '0'),
                    ('Q004A096', 'input', ''),
                    ('Q004A097', 'input', ''),
                    ('Q004A098', 'input', ''),
                    ('Q004A099', 'input', ''),
                    ('Q004A100', 'option', '(1) A normal healthy patient.'),
                    ('Q004A101', 'option', '(2) A patient with a mild systemic disease.'),
                    ('Q004A102', 'option', '(3) A patient with a severe systemic disease.'),
                    ('Q004A103', 'option', '(4) A patient with a severe systemic disease that is a constant threat to life.'),
                    ('Q004A104', 'option', '(5) A moribund patient who is not expected to survive without the operation.'),
                    ('Q004A105', 'option', '(6) A declared brain-dead patient whose organs are being removed for donor purposes.'),
                    ('Q004A106', 'option', 'nml color'),
                    ('Q004A107', 'option', 'pale'),
                    ('Q004A108', 'option', 'flushed'),
                    ('Q004A109', 'option', 'cyanotic'),
                    ('Q004A110', 'input', ''),
                    ('Q004A111', 'option', 'warm'),
                    ('Q004A112', 'option', 'dry'),
                    ('Q004A113', 'option', 'cool'),
                    ('Q004A114', 'option', 'diaphoretic'),
                    ('Q004A115', 'input', ''),
                    ('Q004A116', 'option', 'alert'),
                    ('Q004A117', 'option', 'oriented x4'),
                    ('Q004A118', 'input', ''),
                    ('Q004A119', 'option', 'other:'),
                    ('Q004A120', 'input', ''),
                    ('Q004A121', 'option', 'airway open'),
                    ('Q004A122', 'input', ''),
                    ('Q004A123', 'option', 'no resp. distress'),
                    ('Q004A124', 'option', 'mild distress'),
                    ('Q004A125', 'option', 'moderate distress'),
                    ('Q004A126', 'option', 'severe distress'),
                    ('Q004A127', 'input', ''),
                    ('Q004A128', 'option', 'nml breath sounds'),
                    ('Q004A129', 'option', 'wheezing'),
                    ('Q004A130', 'option', 'crackles'),
                    ('Q004A131', 'option', 'stridor'),
                    ('Q004A132', 'option', 'decreased breath sounds'),
                    ('Q004A133', 'input', ''),
                    ('Q004A134', 'option', 'other:'),
                    ('Q004A135', 'input', ''),
                    ('Q004A136', 'option', 'regular rate'),
                    ('Q004A137', 'option', 'tachycardia'),
                    ('Q004A138', 'option', 'bradycardia'),
                    ('Q004A139', 'option', 'input'),
                    ('Q004A140', 'option', 'other:'),
                    ('Q004A141', 'input', ''),
                    ('Q004A142', 'option', 'restraint released'),
                    ('Q004A143', 'date', ''),
                    ('Q004A144', 'date', ''),
                    ('Q004A145', 'date', ''),
                    ('Q004A146', 'date', ''),
                    ('Q004A147', 'date', ''),
                    ('Q004A148', 'date', ''),
                    ('Q004A149', 'option', 'repositioned'),
                    ('Q004A150', 'date', ''),
                    ('Q004A151', 'date', ''),
                    ('Q004A152', 'date', ''),
                    ('Q004A153', 'date', ''),
                    ('Q004A154', 'date', ''),
                    ('Q004A155', 'date', ''),
                    ('Q004A156', 'option', 'ROM performed'),
                    ('Q004A157', 'date', ''),
                    ('Q004A158', 'date', ''),
                    ('Q004A159', 'date', ''),
                    ('Q004A160', 'date', ''),
                    ('Q004A161', 'date', ''),
                    ('Q004A162', 'date', ''),
                    ('Q004A163', 'option', 'food'),
                    ('Q004A164', 'option', 'fluids'),
                    ('Q004A165', 'date', ''),
                    ('Q004A166', 'date', ''),
                    ('Q004A167', 'date', ''),
                    ('Q004A168', 'date', ''),
                    ('Q004A169', 'date', ''),
                    ('Q004A170', 'date', ''),
                    ('Q004A171', 'option', 'toileting'),
                    ('Q004A172', 'date', ''),
                    ('Q004A173', 'date', ''),
                    ('Q004A174', 'date', ''),
                    ('Q004A175', 'date', ''),
                    ('Q004A176', 'date', ''),
                    ('Q004A177', 'date', ''),
                    ('Q004A178', 'option', 'skin check'),
                    ('Q004A179', 'date', ''),
                    ('Q004A180', 'date', ''),
                    ('Q004A181', 'date', ''),
                    ('Q004A182', 'date', ''),
                    ('Q004A183', 'date', ''),
                    ('Q004A184', 'date', ''),
                    ('Q004A185', 'option', 'circulation'),
                    ('Q004A186', 'date', ''),
                    ('Q004A187', 'date', ''),
                    ('Q004A188', 'date', ''),
                    ('Q004A189', 'date', ''),
                    ('Q004A190', 'date', ''),
                    ('Q004A191', 'date', ''),
                    ('Q004A192', 'option', 'mental status'),
                    ('Q004A193', 'date', ''),
                    ('Q004A194', 'date', ''),
                    ('Q004A195', 'date', ''),
                    ('Q004A196', 'date', ''),
                    ('Q004A197', 'date', ''),
                    ('Q004A198', 'date', ''),
                    ('Q004A199', 'option', 'sleeping'),
                    ('Q004A200', 'date', ''),
                    ('Q004A201', 'date', ''),
                    ('Q004A202', 'date', ''),
                    ('Q004A203', 'date', ''),
                    ('Q004A204', 'date', ''),
                    ('Q004A205', 'date', ''),
                    ('Q004A206', 'option', 'intubated'),
                    ('Q004A207', 'date', ''),
                    ('Q004A208', 'date', ''),
                    ('Q004A209', 'date', ''),
                    ('Q004A210', 'date', ''),
                    ('Q004A211', 'date', ''),
                    ('Q004A212', 'date', ''),
                    ('Q004A213', 'option', 'emotional support'),
                    ('Q004A214', 'date', ''),
                    ('Q004A215', 'date', ''),
                    ('Q004A216', 'date', ''),
                    ('Q004A217', 'date', ''),
                    ('Q004A218', 'date', ''),
                    ('Q004A219', 'date', ''),
                    ('Q004A220', 'option', 'call light in reach'),
                    ('Q004A221', 'date', ''),
                    ('Q004A222', 'date', ''),
                    ('Q004A223', 'date', ''),
                    ('Q004A224', 'date', ''),
                    ('Q004A225', 'date', ''),
                    ('Q004A226', 'date', ''),
                    ('Q004A227', 'option', 'restraints re-applied'),
                    ('Q004A228', 'date', ''),
                    ('Q004A229', 'date', ''),
                    ('Q004A230', 'date', ''),
                    ('Q004A231', 'date', ''),
                    ('Q004A232', 'date', ''),
                    ('Q004A233', 'date', ''),
                    ('Q004A234', 'date', ''),
                    ('Q004A235', 'option', '"Active Time Out"'),
                    ('Q004A236', 'option', 'verified w/'),
                    ('Q004A237', 'option', 'MD'),
                    ('Q004A238', 'option', 'RN'),
                    ('Q004A239', 'input', ''),
                    ('Q004A240', 'date', ''),
                    ('Q004A241', 'option', '1. Patient ID verified with'),
                    ('Q004A242', 'option', 'identifiers'),
                    ('Q004A243', 'input', ''),
                    ('Q004A244', 'date', ''),
                    ('Q004A245', 'option', '2. Correct Procedure, Equipment, and Position Verified'),
                    ('Q004A246', 'option', 'input'),
                    ('Q004A247', 'date', ''),
                    ('Q004A248', 'option', '3. Correct Site Verified and Marked'),
                    ('Q004A249', 'input', ''),
                    ('Q004A250', 'option', 'date & time:'),
                    ('Q004A251', 'date', ''),
                    ('Q004A252', 'option', 'overt actions to staff'),
                    ('Q004A253', 'input', ''),
                    ('Q004A254', 'option', 'harm to'),
                    ('Q004A255', 'option', 'self'),
                    ('Q004A256', 'option', 'others'),
                    ('Q004A257', 'input', ''),
                    ('Q004A258', 'option', 'agitated'),
                    ('Q004A259', 'option', 'combative'),
                    ('Q004A260', 'option', 'low LOC'),
                    ('Q004A261', 'input', ''),
                    ('Q004A262', 'option', 'sedation'),
                    ('Q004A263', 'option', 'unconscious'),
                    ('Q004A264', 'input', ''),
                    ('Q004A265', 'option', 'climbing out of bed'),
                    ('Q004A266', 'option', 'fall risk'),
                    ('Q004A267', 'input', ''),
                    ('Q004A268', 'option', 'unable to follow instructions'),
                    ('Q004A269', 'input', ''),
                    ('Q004A270', 'option', 'pulls at'),
                    ('Q004A271', 'option', 'tubes'),
                    ('Q004A272', 'option', 'IV lines'),
                    ('Q004A273', 'option', 'dressings'),
                    ('Q004A274', 'input', ''),
                    ('Q004A275', 'option', 'other'),
                    ('Q004A276', 'input', ''),
                    ('Q004A277', 'option', 'teaching'),
                    ('Q004A278', 'option', 'patient'),
                    ('Q004A279', 'option', 'family'),
                    ('Q004A280', 'input', ''),
                    ('Q004A281', 'option', 'provide companionship'),
                    ('Q004A282', 'input', ''),
                    ('Q004A283', 'option', 'reality orientation'),
                    ('Q004A284', 'input', ''),
                    ('Q004A285', 'option', 'diversional activities'),
                    ('Q004A286', 'input', ''),
                    ('Q004A287', 'option', 'pain relief'),
                    ('Q004A288', 'input', ''),
                    ('Q004A289', 'option', 'comfort measures'),
                    ('Q004A290', 'input', ''),
                    ('Q004A291', 'option', 'toileting assessed'),
                    ('Q004A292', 'input', ''),
                    ('Q004A293', 'option', 'modify environment'),
                    ('Q004A294', 'input', ''),
                    ('Q004A295', 'input', ''),
                    ('Q004A296', 'option', 'behavior unchanged'),
                    ('Q004A297', 'input', ''),
                    ('Q004A298', 'option', 'patient unable to follow directions'),
                    ('Q004A299', 'input', ''),
                    ('Q004A300', 'option', 'decreased LOC'),
                    ('Q004A301', 'input', ''),
                    ('Q004A302', 'option', 'unable to assess orientation'),
                    ('Q004A303', 'input', ''),
                    ('Q004A304', 'option', 'lack of decision making ability'),
                    ('Q004A305', 'input', ''),
                    ('Q004A306', 'input', ''),
                    ('Q004A307', 'option', 'wrist'),
                    ('Q004A308', 'option', 'x1'),
                    ('Q004A309', 'option', 'x2'),
                    ('Q004A310', 'input', ''),
                    ('Q004A311', 'option', 'ankle'),
                    ('Q004A312', 'option', 'x1'),
                    ('Q004A313', 'option', 'x2'),
                    ('Q004A314', 'input', ''),
                    ('Q004A315', 'option', 'vest'),
                    ('Q004A316', 'input', ''),
                    ('Q004A317', 'option', 'mittens'),
                    ('Q004A318', 'input', ''),
                    ('Q004A319', 'option', 'belt'),
                    ('Q004A320', 'input', ''),
                    ('Q004A321', 'option', 'body net'),
                    ('Q004A322', 'input', ''),
                    ('Q004A323', 'input', ''),
                    ('Q004A324', 'option', 'education'),
                    ('Q004A325', 'option', 'teaching'),
                    ('Q004A326', 'option', 'given to:'),
                    ('Q004A327', 'option', 'patient'),
                    ('Q004A328', 'option', 'family'),
                    ('Q004A329', 'option', 'companion'),
                    ('Q004A330', 'input', ''),
                    ('Q004A331', 'option', 'understands need to restraint'),
                    ('Q004A332', 'input', ''),
                    ('Q004A333', 'option', 'unable to teach'),
                    ('Q004A334', 'option', 'family'),
                    ('Q004A335', 'option', 'companion'),
                    ('Q004A336', 'option', 'not available'),
                    ('Q004A337', 'input', '')
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