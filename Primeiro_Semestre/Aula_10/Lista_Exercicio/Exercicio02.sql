/* 2)	Fa�a uma fun��o chamada FUN_CONSULTA_PED_RMNNNNN, para consultar PEDIDO usando como par�metro o
 c�digo do pedido. Use para fazer a consulta SELECT INTO, e use os EXCEPTIONS necess�rios.
 */
 
CREATE OR REPLACE FUNCTION FUN_CONSULTA_PED_RMNNNNN (
    P_COD_PEDIDO              PEDIDO.COD_PEDIDO%TYPE
) RETURN PEDIDO%ROWTYPE IS
    v_pedido PEDIDO%ROWTYPE;  -- Vari�vel para armazenar o resultado da consulta

    -- Exce��es personalizadas
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
        RAISE pedido_nao_encontrado;  -- Lan�a exce��o se nenhum pedido for encontrado
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
        DBMS_OUTPUT.PUT_LINE('Pedido n�o encontrado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
