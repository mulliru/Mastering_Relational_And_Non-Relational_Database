-- 1) Fazer um bloco anônimo com cursor que realize uma consulta na tabela de clientes e retorne o 
--código e o nome cliente, use dbms_output para mostrar as informações como o exemplo abana
    --Cliente: 1 Nome: Jose da Silva
    --Cliente: 2 Nome: Maria da Silva
    
-- Bloco anônimo com cursor para exibir código e nome dos clientes
DECLARE
    -- Definição do cursor para selecionar código e nome do cliente
    CURSOR c_consulta_cliente IS
        SELECT cod_cliente, nom_cliente
        FROM cliente; -- Certifique-se de que o nome da tabela esteja correto ('clienter' parece um erro, talvez seja 'clientes')
    
BEGIN
    -- Loop para percorrer cada linha retornada pelo cursor
    FOR x IN c_consulta_cliente LOOP
        -- Exibe o código e nome do cliente usando dbms_output
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || x.cod_cliente || ' Nome: ' || x.nom_cliente);
    END LOOP;
END;

SELECT nom_cliente FROM user_tab_columns WHERE table_name = 'CLIENTES';
