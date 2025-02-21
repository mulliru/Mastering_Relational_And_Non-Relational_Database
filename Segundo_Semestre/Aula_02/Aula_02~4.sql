BEGIN
    FOR x IN (
        SELECT table_name 
        FROM user_tables 
        WHERE table_name IN ('PRODUTOS_NOVOS')
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' 
                            || x.table_name 
                            || ' CASCADE CONSTRAINTS';
    END LOOP;
END;
/
