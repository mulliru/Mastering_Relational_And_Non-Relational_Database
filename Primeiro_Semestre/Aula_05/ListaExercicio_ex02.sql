-- Habilita a exibição de saída no console para ver os resultados do DBMS_OUTPUT.PUT_LINE
SET SERVEROUTPUT ON;

-- Início do bloco anônimo PL/SQL
BEGIN
    -- O loop FOR vai iterar sobre cada linha retornada pela consulta SQL
    FOR i IN (
        -- Consulta SQL que calcula a média dos valores totais dos pedidos para um cliente específico
        SELECT
            hp.cod_cliente,  -- Código do cliente (identificador único do cliente)
            cli.nom_cliente, -- Nome do cliente
            ROUND(AVG(hp.val_total_pedido), 2) AS media  -- Média dos valores totais dos pedidos, arredondada para 2 casas decimais
        FROM
            historico_pedido hp  -- Tabela que contém o histórico dos pedidos
            INNER JOIN cliente cli ON hp.cod_cliente = cli.cod_cliente  -- Junta a tabela de pedidos com a tabela de clientes para obter o nome do cliente
        WHERE
            hp.cod_cliente = &cliente  -- Filtra os registros para o cliente específico
        GROUP BY
            hp.cod_cliente,  -- Agrupa os resultados pelo código do cliente
            cli.nom_cliente  -- Também agrupa pelo nome do cliente
    ) LOOP
        -- Exibe uma linha para cada resultado da consulta
        dbms_output.put_line('O cliente de nome '  -- Mensagem de saída
                            || i.nom_cliente  -- Nome do cliente
                            || ' teve a média de '  -- Texto explicativo
                            || i.media  -- Média dos valores totais dos pedidos
                            || ' de compras');  -- Texto explicativo
    END LOOP;  -- Fim do loop FOR
END;  -- Fim do bloco PL/SQL

