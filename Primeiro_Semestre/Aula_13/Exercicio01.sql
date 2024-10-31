/*
Questão 1: Procedure para Listar Pedidos de um Cliente 
Descrição: Crie uma procedure chamada listar_pedidos_cliente que recebe o código de um cliente e exibe seus pedidos e valores. Se o cliente não existir, lance uma exceção personalizada. Use um cursor para listar os pedidos e um IF para verificar se há registros antes de exibir os pedidos.
Requisitos:
• Exceção: Lance uma exceção personalizada se o cliente não for encontrado.
• JOIN: Use INNER JOIN para combinar pedido com historico_pedido.
• IF: Verifique se o cliente possui pedidos.
• Cursor: Utilize um cursor para iterar sobre os pedidos.
*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE listar_pedido_cliente(P_CLIENTE NUMBER) IS
    MINHA_EXC EXCEPTION;
    CLIENTE_NAO_ENCONTRADO BOOLEAN := TRUE;

    CURSOR HIST_PEDIDO IS 
        SELECT
            a.cod_cliente,
            c.nom_cliente,
            b.val_total_pedido,
            a.status
        FROM
            pedido a
            INNER JOIN historico_pedido b ON (a.cod_pedido = b.cod_pedido)
            INNER JOIN cliente c ON (a.cod_cliente = c.cod_cliente)
        WHERE 
            a.cod_cliente = P_CLIENTE;

BEGIN
    FOR X IN HIST_PEDIDO LOOP
        CLIENTE_NAO_ENCONTRADO := FALSE;
        DBMS_OUTPUT.PUT_LINE('Código do Cliente: ' || x.cod_cliente || ' - Nome: ' || x.nom_cliente || ' - Valor Pedido: ' || x.val_total_pedido);
    END LOOP;

    IF CLIENTE_NAO_ENCONTRADO THEN
        RAISE MINHA_EXC;
    END IF;

EXCEPTION
    WHEN MINHA_EXC THEN
        DBMS_OUTPUT.PUT_LINE('NAO EXISTE CLIENTE CADASTRADO');
END;

CALL listar_pedido_cliente(22); --Exemplo cliente Vinicius Castro 
