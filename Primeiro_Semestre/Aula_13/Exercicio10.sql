/*
Quest�o 10: Fun��o para Calcular Total de Estoque por Tipo de Produto 
Descri��o: Desenvolva uma fun��o chamada calcular_estoque_tipo_produto que recebe o tipo de produto e retorna o total em estoque. Lance uma exce��o se n�o houver produtos desse tipo em estoque. Use um cursor para iterar pelos produtos e um LOOP para somar a quantidade total.
Requisitos:
�	Exce��o: Lance uma exce��o se n�o houver estoque para o tipo de produto.
�	JOIN: Use INNER JOIN entre produto e estoque_produto.
�	Cursor: Utilize um cursor para iterar sobre os produtos.
�	LOOP: Utilize um loop para somar a quantidade em estoque.

-Pedro
*/

SELECT * FROM produto;
SELECT * FROM estoque_produto;

CREATE OR REPLACE FUNCTION calcular_estoque_tipo_produto (
    p_tipo_produto VARCHAR2
) RETURN NUMBER IS
    sem_estoque_tipo EXCEPTION;
    CURSOR estoque_cursor IS
        SELECT ep.QTD_PRODUTO
        FROM produto p
        INNER JOIN estoque_produto ep ON p.COD_PRODUTO = ep.COD_PRODUTO
        WHERE p.NOM_PRODUTO = p_tipo_produto
        AND p.STA_ATIVO = 'Ativo';
    v_total_estoque NUMBER := 0;
    v_qtd_produto NUMBER;
BEGIN
    OPEN estoque_cursor;
    LOOP
        FETCH estoque_cursor INTO v_qtd_produto;
        EXIT WHEN estoque_cursor%NOTFOUND;
        v_total_estoque := v_total_estoque + v_qtd_produto;
    END LOOP;
    CLOSE estoque_cursor;

    IF v_total_estoque = 0 THEN
        RAISE sem_estoque_tipo;
    END IF;

    RETURN v_total_estoque;

EXCEPTION
    WHEN sem_estoque_tipo THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Não há produtos desse tipo em estoque.');
        RETURN NULL;
END;
/

DECLARE
    v_total_estoque NUMBER;
BEGIN
    v_total_estoque := calcular_estoque_tipo_produto('asdasd');
    DBMS_OUTPUT.PUT_LINE('Total em estoque para o tipo: ' || v_total_estoque);
END;
/
