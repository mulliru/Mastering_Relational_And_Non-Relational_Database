SET SERVEROUTPUT ON;

DECLARE
    -- Vari�vel para armazenar a entrada do sexo do cliente
    sexo CHAR(1) := '&Sexo'; -- Use &Sexo para receber a entrada do usu�rio

    -- Vari�vel para armazenar a mensagem de sa�da
    mensagem VARCHAR2(50);
BEGIN
    IF LOWER(sexo) = 'm' THEN
        mensagem := 'Masculino';
    ELSIF LOWER(sexo) = 'f' THEN
        mensagem := 'Feminino';
    ELSE
        mensagem := 'Outros';
    END IF;

    -- Exibe a mensagem resultante
    dbms_output.put_line('Sexo: ' || mensagem);
END;
