/*
Quest�o 8: Fun��o para Calcular Quantidade M�dia de Itens por Pedido 
Descri��o: Desenvolva uma fun��o chamada media_itens_por_pedido que calcula a m�dia de itens nos pedidos de um cliente. Lance uma exce��o caso o cliente n�o tenha pedidos. Use um WHILE para contar os itens e uma vari�vel para armazenar a soma das quantidades.
Requisitos:
�	Exce��o: Lance uma exce��o se o cliente n�o tiver pedidos.
�	JOIN: Use INNER JOIN entre cliente e pedido.
�	WHILE: Utilize um la�o WHILE para contar os itens.
�	Vari�vel: Armazene a soma das quantidades.

-Pedro
*/
SELECT * FROM pedido;
SELECT * FROM cliente;
SELECT * FROM item_pedido;

CREATE OR REPLACE FUNCTION media_itens_por_pedido (
    p_cod_cliente NUMBER
) RETURN NUMBER IS
    cliente_sem_pedidos EXCEPTION;
    CURSOR itens_cursor IS
        SELECT ip.QTD_ITEM
        FROM cliente c
        INNER JOIN pedido p ON c.COD_CLIENTE = p.COD_CLIENTE
        INNER JOIN item_pedido ip ON p.COD_PEDIDO = ip.COD_PEDIDO
        WHERE c.COD_CLIENTE = p_cod_cliente;

    v_soma_quantidades NUMBER := 0;
    v_contagem_pedidos NUMBER := 0;
    v_qtd_item NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_contagem_pedidos
    FROM pedido
    WHERE COD_CLIENTE = p_cod_cliente;

    IF v_contagem_pedidos = 0 THEN
        RAISE cliente_sem_pedidos;
    END IF;

    OPEN itens_cursor;
    LOOP
        FETCH itens_cursor INTO v_qtd_item;
        EXIT WHEN itens_cursor%NOTFOUND;
        v_soma_quantidades := v_soma_quantidades + v_qtd_item;
    END LOOP;
    CLOSE itens_cursor;

    RETURN v_soma_quantidades / v_contagem_pedidos;

EXCEPTION
    WHEN cliente_sem_pedidos THEN
        DBMS_OUTPUT.PUT_LINE('Erro: O cliente não possui pedidos.');
        RETURN NULL;
END;
/

DECLARE
    v_media_itens NUMBER;
BEGIN
    v_media_itens := media_itens_por_pedido(1111111);
    DBMS_OUTPUT.PUT_LINE('Média de itens por pedido: ' || v_media_itens);
END;
/
