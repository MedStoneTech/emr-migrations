-- Rollback script for ChartsSourceOfTruth additions for the Procedures CriticalCare section options
DO $$
DECLARE
    chart_code TEXT;
    elem RECORD;
BEGIN
    FOR chart_code IN
        SELECT * FROM (VALUES
            ('T001x'), ('T002x'), ('T003x'), ('T006x'), ('T007x'),
            ('T008x'), ('T009x'), ('T010x'), ('T011x'), ('T012x'),
            ('T013x'), ('T015x'), ('T024x'), ('T025x'), ('T028x'),
            ('T029x'), ('T030x'), ('T031x'), ('T032x'), ('T033x'),
            ('T035x'), ('T036x'), ('T039x'), ('T040x'), ('T042x'),
            ('T051x'), ('T057x'), ('T058x'), ('T070a')
        ) AS t(chart_code)
    LOOP
        FOR elem IN
            SELECT * FROM (
                VALUES
                    ('Q003'), ('cprResuscitationSwitch'),
                    ('Q003A001'), ('Q003A002'),
                    ('Q003A003'), ('Q003A004'), ('Q003A005'),
                    ('Q003A006'), ('Q003A007'), ('Q003A008'),
                    ('Q003A009'), ('Q003A010'), ('Q003A011'),
                    ('Q003A012'), ('Q003A013'), ('Q003A014'),
                    ('Q003A015'), ('Q003A016'), ('Q003A017'),
                    ('Q003A018'), ('Q003A019'), ('Q003A020'),
                    ('Q003A021'), ('Q003A022'), ('Q003A023'),
                    ('Q003A024'), ('Q003A025'), ('Q003A026'),
                    ('Q003A028'), ('Q003A029'), ('Q003A030'),
                    ('Q003A031'), ('Q003A032'), ('Q003A033'),
                    ('Q003A034'), ('Q003A035'), ('Q003A036'),
                    ('Q003A037'), ('Q003A038'), ('Q003A039'),
                    ('Q003A040'), ('Q003A041'), ('Q003A042'),
                    ('Q003A043'), ('Q003A044'), ('Q003A045'),
                    ('Q003A046'), ('Q003A047'), ('Q003A048'),
                    ('Q003A049'), ('Q003A050'),
                    ('Q003A051'), ('Q003A052'), ('Q003A053'),
                    ('Q003A054'), ('Q003A055'), ('Q003A056'),
                    ('Q003A057'), ('Q003A058'), ('Q003A059'),
                    ('Q003A060'), ('Q003A061'), ('Q003A062'),
                    ('Q003A063'), ('Q003A064'), ('Q003A065'),
                    ('Q003A066'), ('Q003A067'), ('Q003A068'),
                    ('Q003A069'), ('Q003A070'), ('Q003A071'),
                    ('Q003A072'), ('Q003A073'), ('Q003A074'),
                    ('Q003A075'), ('Q003A076'), ('Q003A077'),
                    ('Q003A078'), ('Q003A079'), ('Q003A080'),
                    ('Q003A081'), ('Q003A082'), ('Q003A083'),
                    ('Q003A084'), ('Q003A085'), ('Q003A086'),
                    ('Q003A087'), ('Q003A088'), ('Q003A089'),
                    ('Q003A090'), ('Q003A091'), ('Q003A092'),
                    ('Q003A093'), ('Q003A094'), ('Q003A095'),
                    ('Q003A096'), ('Q003A097'), ('Q003A098'),
                    ('Q003A099'), ('Q003A100'), ('Q003A101'),
                    ('Q003A102'), ('Q003A103'), ('Q003A104'),
                    ('Q003A105'), ('Q003A106'), ('Q003A107'),
                    ('Q003A108'), ('Q003A109'), ('Q003A110')
            ) AS e(answer_code)
        LOOP
            DELETE FROM public."ChartsSourceOfTruth"
            WHERE "ChartCode" = chart_code AND "AnswerCode" = elem.answer_code;
        END LOOP;
    END LOOP;
END $$;
