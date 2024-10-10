/* 2)	Faça uma função chamada FUN_CONSULTA_PED_RMNNNNN, para consultar PEDIDO usando como parâmetro o
 código do pedido. Use para fazer a consulta SELECT INTO, e use os EXCEPTIONS necessários.
 */
 
CREATE OR REPLACE FUNCTION FUN_CONSULTA_PED_RMNNNNN (
    P_COD_PEDIDO              PEDIDO.COD_PEDIDO%TYPE
) RETURN PEDIDO%ROWTYPE IS
    v_pedido PEDIDO%ROWTYPE;  -- Variável para armazenar o resultado da consulta

    -- Exceções personalizadas
    pedido_nao_encontrado EXCEPTION;
BEGIN
    -- Consulta usando SELECT INTO
    SELECT *
    INTO v_pedido
    FROM PEDIDO
    WHERE COD_PEDIDO = P_COD_PEDIDO;

    RETURN v_pedido;  -- Retorna o registro encontrado

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE pedido_nao_encontrado;  -- Lança exceção se nenhum pedido for encontrado
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro inesperado: ' || SQLERRM);  -- Captura outros erros
END FUN_CONSULTA_PED_RMNNNNN;

--testando para ver se realmente esta funciionando 
DECLARE
    v_resultado PEDIDO%ROWTYPE;
BEGIN
    v_resultado := FUN_CONSULTA_PED_RMNNNNN(1);
    DBMS_OUTPUT.PUT_LINE('Pedido encontrado: ' || v_resultado.cod_pedido);
EXCEPTION
    WHEN pedido_nao_encontrado THEN
        DBMS_OUTPUT.PUT_LINE('Pedido não encontrado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
