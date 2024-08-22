SET SERVEROUTPUT ON;

DECLARE
    -- Variável para armazenar a entrada do sexo do cliente
    sexo CHAR(1) := '&Sexo'; -- Use &Sexo para receber a entrada do usuário

    -- Variável para armazenar a mensagem de saída
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
