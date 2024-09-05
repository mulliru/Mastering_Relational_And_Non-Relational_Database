SET SERVEROUTPUT ON;

-- 1.	Crie um bloco an�nimo que calcula o total de movimenta��es de estoque para um determinado produto.
BEGIN
    FOR X IN (
        SELECT
        a.cod_produto,
        b.nom_produto,
        SUM(qtd_movimentacao_estoque) qtd
    FROM
                movimento_estoque a
        INNER JOIN produto b ON a.cod_produto = b.cod_produto
    WHERE
        a.cod_produto = &produto
    GROUP BY
        a.cod_produto,
        b.nom_produto
    ) LOOP
        dbms_output.put_line('O produto de C�digo '
                             || x.cod_produto
                             || 'Com descri��o'
                             || x.nom_produto
                             || 'Tem o total de'
                             || x.qtd
                             || 'Produtos no Estoque');
    End LOOP;
END;
