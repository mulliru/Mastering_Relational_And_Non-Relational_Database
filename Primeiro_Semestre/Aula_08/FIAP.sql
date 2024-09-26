

CREATE OR REPLACE PROCEDURE prd_deletar_vendas IS
    CONTADOR NUMBER :=0;
BEGIN
    FOR x IN ( SELECT * FROM tb_vendas) LOOP
        DELETE FROM tb_vendas where ordernumber = x.ordernumber;
        IF MOD (contador, 100) = 0 THEN
            COMMIT;
        END IF;
        contador := contador +1;
    END LOOP;
END;
/

/* para executar a procedure */
EXECUTE prd_deletar_vendas();