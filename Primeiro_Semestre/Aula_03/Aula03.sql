SET SERVEROUTPUT ON;

DECLARE
    -- Vari�vel para armazenar a entrada do n�mero
    numero NUMBER := &Numero; -- Use &Numero para inserir o n�mero desejado

    -- Vari�vel para armazenar a mensagem de sa�da
    mensagem VARCHAR2(10);
BEGIN
    -- Verifica se o n�mero � par ou �mpar
    IF MOD(numero, 2) = 0 THEN
        mensagem := 'Par';
    ELSE
        mensagem := '�mpar';
    END IF;

    -- Exibe a mensagem resultante
    DBMS_OUTPUT.PUT_LINE('N�mero: ' || mensagem);
END;

