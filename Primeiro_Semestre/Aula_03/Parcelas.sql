
set SERVEROUTPUT on;
DECLARE
    carro_valor NUMBER := &ValordoCarro;
    Parcela NUMBER;
BEGIN
    Parcela := (carro_valor * 1.03) / 10;
    dbms_output.put_line('O valor de cada parcela será: R$' ||parcela);
END;