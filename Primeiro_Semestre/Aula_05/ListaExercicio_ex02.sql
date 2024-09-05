-- Habilita a exibi��o de sa�da no console para ver os resultados do DBMS_OUTPUT.PUT_LINE
SET SERVEROUTPUT ON;

-- In�cio do bloco an�nimo PL/SQL
BEGIN
    -- O loop FOR vai iterar sobre cada linha retornada pela consulta SQL
    FOR i IN (
        -- Consulta SQL que calcula a m�dia dos valores totais dos pedidos para um cliente espec�fico
        SELECT
            hp.cod_cliente,  -- C�digo do cliente (identificador �nico do cliente)
            cli.nom_cliente, -- Nome do cliente
            ROUND(AVG(hp.val_total_pedido), 2) AS media  -- M�dia dos valores totais dos pedidos, arredondada para 2 casas decimais
        FROM
            historico_pedido hp  -- Tabela que cont�m o hist�rico dos pedidos
            INNER JOIN cliente cli ON hp.cod_cliente = cli.cod_cliente  -- Junta a tabela de pedidos com a tabela de clientes para obter o nome do cliente
        WHERE
            hp.cod_cliente = &cliente  -- Filtra os registros para o cliente espec�fico
        GROUP BY
            hp.cod_cliente,  -- Agrupa os resultados pelo c�digo do cliente
            cli.nom_cliente  -- Tamb�m agrupa pelo nome do cliente
    ) LOOP
        -- Exibe uma linha para cada resultado da consulta
        dbms_output.put_line('O cliente de nome '  -- Mensagem de sa�da
                            || i.nom_cliente  -- Nome do cliente
                            || ' teve a m�dia de '  -- Texto explicativo
                            || i.media  -- M�dia dos valores totais dos pedidos
                            || ' de compras');  -- Texto explicativo
    END LOOP;  -- Fim do loop FOR
END;  -- Fim do bloco PL/SQL

