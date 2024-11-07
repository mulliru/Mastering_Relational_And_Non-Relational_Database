/*
Quest�o 9: Procedure para Listar Clientes com Pedidos Acima de um Valor 
Descri��o: Crie uma procedure chamada listar_clientes_pedidos_acima_valor que exibe os clientes com pedidos acima de um valor especificado. Lance uma exce��o se nenhum cliente for encontrado. Utilize um cursor para iterar sobre os pedidos e um IF para verificar se o valor do pedido excede o limite.
Requisitos:
�	Exce��o: Lance uma exce��o caso nenhum cliente tenha pedidos acima do valor.
�	JOIN: Utilize INNER JOIN entre cliente e historico_pedido.
�	Cursor: Utilize um cursor para iterar pelos pedidos.
�	IF: Verifique se o valor do pedido excede o limite.

-Pedro
*/

SELECT * FROM cliente;
SELECT * FROM historico_pedido;

CREATE OR REPLACE PROCEDURE listar_clientes_pedidos_acima_valor (
    p_valor_minimo NUMBER
) IS
    nenhum_cliente_encontrado EXCEPTION;
    CURSOR clientes_cursor IS
        SELECT c.COD_CLIENTE, c.NOM_CLIENTE, hp.VAL_TOTAL_PEDIDO
        FROM cliente c
        INNER JOIN historico_pedido hp ON c.COD_CLIENTE = hp.COD_CLIENTE
        WHERE c.STA_ATIVO = 'S';

    v_cod_cliente cliente.COD_CLIENTE%TYPE;
    v_nom_cliente cliente.NOM_CLIENTE%TYPE;
    v_val_total_pedido historico_pedido.VAL_TOTAL_PEDIDO%TYPE;
    v_contagem_clientes NUMBER := 0;
BEGIN
    OPEN clientes_cursor;
    LOOP
        FETCH clientes_cursor INTO v_cod_cliente, v_nom_cliente, v_val_total_pedido;
        EXIT WHEN clientes_cursor%NOTFOUND;
        
        IF v_val_total_pedido > p_valor_minimo THEN
            v_contagem_clientes := v_contagem_clientes + 1;
            DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_nom_cliente || ', Código: ' || v_cod_cliente || ', Valor do Pedido: ' || v_val_total_pedido);
        END IF;
    END LOOP;
    CLOSE clientes_cursor;

    IF v_contagem_clientes = 0 THEN
        RAISE nenhum_cliente_encontrado;
    END IF;

EXCEPTION
    WHEN nenhum_cliente_encontrado THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Nenhum cliente com pedidos acima do valor especificado foi encontrado.');
END;
/

BEGIN
    listar_clientes_pedidos_acima_valor(9000);
END;
/
