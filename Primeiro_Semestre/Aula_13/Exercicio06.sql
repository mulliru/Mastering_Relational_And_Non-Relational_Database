/*
Questão 6: Função para Calcular Média de Desconto por Pedido com Exceções
Descrição: Desenvolva uma função chamada `media_desconto_pedido` que calcula a média dos descontos aplicados aos pedidos de um cliente. Lance uma exceção caso o cliente não tenha descontos aplicados. Utilize um cursor para iterar sobre os pedidos e uma variável para armazenar a soma dos descontos.

Requisitos:
- Exceção: Lance uma exceção se o cliente não tiver descontos.
- JOIN: Use INNER JOIN entre as tabelas `pedido` e `historico_pedido`.
- Cursor: Utilize um cursor para iterar sobre os descontos.
- Variável: Armazene a soma dos descontos em uma variável.

- Murillo
*/

CREATE OR REPLACE FUNCTION media_desconto_pedido(p_cod_cliente IN NUMBER) RETURN NUMBER IS
    -- Cursor para selecionar os descontos dos pedidos do cliente
    CURSOR cur_descontos IS
        SELECT hp.val_desconto
        FROM pedido p
        INNER JOIN historico_pedido hp ON p.cod_pedido = hp.cod_pedido
        WHERE p.cod_cliente = p_cod_cliente;

    -- Variáveis para armazenar a soma dos descontos e a contagem de pedidos
    v_soma_desconto NUMBER := 0;
    v_contagem_pedidos NUMBER := 0;
    v_media_desconto NUMBER;

BEGIN
    -- Iterando sobre os descontos com o cursor
    FOR reg_desconto IN cur_descontos LOOP
        v_soma_desconto := v_soma_desconto + reg_desconto.val_desconto;
        v_contagem_pedidos := v_contagem_pedidos + 1;
    END LOOP;

    -- Verificação para lançar exceção caso não haja descontos
    IF v_contagem_pedidos = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'O cliente não possui descontos aplicados em pedidos.');
    ELSE
        -- Cálculo da média de desconto
        v_media_desconto := v_soma_desconto / v_contagem_pedidos;
    END IF;

    RETURN v_media_desconto;
END media_desconto_pedido;
/
