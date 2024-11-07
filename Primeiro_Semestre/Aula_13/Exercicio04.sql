/*
Questï¿½o 4: Funï¿½ï¿½o para Contar Pedidos Cancelados 
Descriï¿½ï¿½o: Desenvolva uma funï¿½ï¿½o chamada contar_pedidos_cancelados que recebe o cï¿½digo de um cliente e conta seus pedidos cancelados. Lance uma exceï¿½ï¿½o se o cliente nï¿½o tiver pedidos. Utilize um cursor para iterar pelos pedidos e um IF para verificar o status de cancelamento.
Requisitos:
ï¿½	Exceï¿½ï¿½o: Lance uma exceï¿½ï¿½o caso o cliente nï¿½o tenha pedidos.
ï¿½	JOIN: Use INNER JOIN entre cliente e pedido.
ï¿½	Cursor: Utilize um cursor para iterar pelos pedidos.
ï¿½	IF: Verifique se o pedido estï¿½ cancelado.

- Lari
*/

CREATE OR REPLACE FUNCTION contar_pedidos_cancelados (
    p_cod_cliente IN NUMBER
) RETURN NUMBER IS
    -- Variável para armazenar a contagem dos pedidos cancelados
    v_contagem INTEGER := 0;
    
    -- Variável para armazenar o status do pedido
    v_status VARCHAR2(20);
    
BEGIN
    -- Consulta para iterar pelos pedidos do cliente
    FOR r IN (
        SELECT p.status
        FROM pedido p
        INNER JOIN cliente c ON c.id_cliente = p.id_cliente
        WHERE c.id_cliente = p_cod_cliente
    ) LOOP
        -- Verifica se o status do pedido é 'cancelado'
        IF r.status = 'cancelado' THEN
            v_contagem := v_contagem + 1;
        END IF;
    END LOOP;
    
    -- Se não houver pedidos cancelados, lança exceção
    IF v_contagem = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'O cliente não possui pedidos cancelados.');
    END IF;

    -- Retorna o número de pedidos cancelados
    RETURN v_contagem;

EXCEPTION
    WHEN OTHERS THEN
        -- Caso ocorra algum erro, lança uma exceção geral
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Erro ao contar pedidos cancelados: ' || SQLERRM);
END contar_pedidos_cancelados;
/
