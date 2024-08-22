SET SERVEROUTPUT ON;

DECLARE
    -- Variável para armazenar a entrada do número
    numero NUMBER := &Numero; -- Use &Numero para inserir o número desejado

    -- Variável para armazenar a mensagem de saída
    mensagem VARCHAR2(10);
BEGIN
    -- Verifica se o número é par ou ímpar
    IF MOD(numero, 2) = 0 THEN
        mensagem := 'Par';
    ELSE
        mensagem := 'Ímpar';
    END IF;

    -- Exibe a mensagem resultante
    DBMS_OUTPUT.PUT_LINE('Número: ' || mensagem);
END;

