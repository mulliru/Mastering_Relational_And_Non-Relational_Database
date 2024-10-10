CREATE OR REPLACE PROCEDURE PRC_INSERE_PEDIDO_RMNNNNN (
    P_DAT_PEDIDO              PEDIDO.DAT_PEDIDO%TYPE,
    P_DAT_ENTREGA             PEDIDO.DAT_ENTREGA%TYPE,
    P_VAL_TOTAL_PEDIDO        PEDIDO.VAL_TOTAL_PEDIDO%TYPE
) IS
    -- Exce��es personalizadas
    data_entrega_invalida EXCEPTION;
    data_pedido_invalida EXCEPTION;
    valor_pedido_invalido EXCEPTION;

BEGIN
    -- Valida��es
    IF P_DAT_PEDIDO > P_DAT_ENTREGA THEN
        RAISE data_entrega_invalida;
    ELSIF P_DAT_PEDIDO > SYSDATE THEN
        RAISE data_pedido_invalida;
    ELSIF P_VAL_TOTAL_PEDIDO <= 0 THEN
        RAISE valor_pedido_invalido;
    END IF;

    -- Aqui voc� incluiria a l�gica para inserir os dados na tabela PEDIDO
    INSERT INTO PEDIDO (
        cod_pedido,
        cod_pedido_relacionado,
        cod_cliente,
        cod_usuario,
        cod_vendedor,
        dat_pedido,
        dat_cancelamento,
        dat_entrega,
        val_total_pedido,
        val_desconto,
        seq_endereco_cliente
    ) VALUES (
        -- Aqui voc� deve substituir pelos par�metros adequados
        /* valores a serem inseridos */
    );

    COMMIT;

EXCEPTION
    WHEN data_entrega_invalida THEN
        RAISE_APPLICATION_ERROR(-20001, 'A Data de entrega n�o pode ser anterior � data do pedido.');
    WHEN data_pedido_invalida THEN
        RAISE_APPLICATION_ERROR(-20002, 'A Data do pedido n�o pode ser superior � data atual.');
    WHEN valor_pedido_invalido THEN
        RAISE_APPLICATION_ERROR(-20003, 'O valor do pedido n�o pode ser 0 ou inferior.');
END PRC_INSERE_PEDIDO_RMNNNNN;
