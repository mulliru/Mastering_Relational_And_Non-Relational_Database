-- 1) Fazer um bloco an�nimo com cursor que realize uma consulta na tabela de clientes e retorne o 
--c�digo e o nome cliente, use dbms_output para mostrar as informa��es como o exemplo abana
    --Cliente: 1 Nome: Jose da Silva
    --Cliente: 2 Nome: Maria da Silva
    
-- Bloco an�nimo com cursor para exibir c�digo e nome dos clientes
DECLARE
    -- Defini��o do cursor para selecionar c�digo e nome do cliente
    CURSOR c_consulta_cliente IS
        SELECT cod_cliente, nom_cliente
        FROM cliente; -- Certifique-se de que o nome da tabela esteja correto ('clienter' parece um erro, talvez seja 'clientes')
    
BEGIN
    -- Loop para percorrer cada linha retornada pelo cursor
    FOR x IN c_consulta_cliente LOOP
        -- Exibe o c�digo e nome do cliente usando dbms_output
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || x.cod_cliente || ' Nome: ' || x.nom_cliente);
    END LOOP;
END;

SELECT nom_cliente FROM user_tab_columns WHERE table_name = 'CLIENTES';
