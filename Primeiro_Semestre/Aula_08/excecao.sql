DECLARE
    minhaexe EXCEPTION;
    n NUMBER := 10;
BEGIN
    FOR i IN 1..n LOOP
        dbms_output.put_line(i * n);
        IF (i * 2) = 10 THEN
            RAISE minhaexe;
        END IF;
    END LOOP;
EXCEPTION
    WHEN minhaexe THEN
        RAISE_APPLICATION_ERROR(-20001, 'Você caiu na exceção, bobão');
END;
