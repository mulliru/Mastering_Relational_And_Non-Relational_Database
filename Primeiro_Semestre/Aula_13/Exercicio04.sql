/*
Quest�o 4: Fun��o para Contar Pedidos Cancelados 
Descri��o: Desenvolva uma fun��o chamada contar_pedidos_cancelados que recebe o c�digo de um cliente e conta seus pedidos cancelados. Lance uma exce��o se o cliente n�o tiver pedidos. Utilize um cursor para iterar pelos pedidos e um IF para verificar o status de cancelamento.
Requisitos:
�	Exce��o: Lance uma exce��o caso o cliente n�o tenha pedidos.
�	JOIN: Use INNER JOIN entre cliente e pedido.
�	Cursor: Utilize um cursor para iterar pelos pedidos.
�	IF: Verifique se o pedido est� cancelado.

- Lari
*/

CREATE OR REPLACE FUNCTION contar_pedidos_cancelados (
    p_cod_cliente IN NUMBER
) RETURN NUMBER IS
    -- Vari�vel para armazenar a contagem dos pedidos cancelados
    v_contagem INTEGER := 0;
    
    -- Vari�vel para armazenar o status do pedido
    v_status VARCHAR2(20);
    
BEGIN
    -- Consulta para iterar pelos pedidos do cliente
    FOR r IN (
        SELECT p.status
        FROM pedido p
        INNER JOIN cliente c ON c.id_cliente = p.id_cliente
        WHERE c.id_cliente = p_cod_cliente
    ) LOOP
        -- Verifica se o status do pedido � 'cancelado'
        IF r.status = 'cancelado' THEN
            v_contagem := v_contagem + 1;
        END IF;
    END LOOP;
    
    -- Se n�o houver pedidos cancelados, lan�a exce��o
    IF v_contagem = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'O cliente n�o possui pedidos cancelados.');
    END IF;

    -- Retorna o n�mero de pedidos cancelados
    RETURN v_contagem;

EXCEPTION
    WHEN OTHERS THEN
        -- Caso ocorra algum erro, lan�a uma exce��o geral
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Erro ao contar pedidos cancelados: ' || SQLERRM);
END contar_pedidos_cancelados;
/
