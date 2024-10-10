create or replace PROCEDURE PRC_INSERE_PEDIDO(P_COD_PEDIDO             PEDIDO.COD_PEDIDO%TYPE,
                                              P_COD_PEDIDO_RELACIONADO PEDIDO.COD_PEDIDO%TYPE,
                                              P_COD_CLIENTE            PEDIDO.COD_CLIENTE%TYPE,
                                              P_COD_USUARIO            PEDIDO.COD_USUARIO%TYPE,
                                              P_COD_VENDEDOR           PEDIDO.COD_VENDEDOR%TYPE,
                                              P_DAT_PEDIDO             PEDIDO.DAT_PEDIDO%TYPE,
                                              P_DAT_CANCELAMENTO       PEDIDO.DAT_CANCELAMENTO%TYPE,
                                              P_DAT_ENTREGA            PEDIDO.DAT_ENTREGA%TYPE,
                                              P_VAL_TOTAL_PEDIDO       PEDIDO.VAL_TOTAL_PEDIDO%TYPE,
                                              P_VAL_DESCONTO           PEDIDO.VAL_DESCONTO%TYPE,
                                              P_SEQ_ENDERECO_CLIENTE   PEDIDO.SEQ_ENDERECO_CLIENTE%TYPE) IS
data_invalida EXCEPTION;											  
 
BEGIN
 
  INSERT INTO PEDIDO
    (cod_pedido,
     cod_pedido_relacionado,
     cod_cliente,
     cod_usuario,
     cod_vendedor,
     dat_pedido,
     dat_cancelamento,
     dat_entrega,
     val_total_pedido,
     val_desconto,
     seq_endereco_cliente)
  VALUES
    (p_cod_pedido,
     p_cod_pedido_relacionado,
     p_cod_cliente,
     p_cod_usuario,
     p_cod_vendedor,
     p_dat_pedido,
     p_dat_cancelamento,
     p_dat_entrega,
     p_val_total_pedido,
     p_val_desconto,
     p_seq_endereco_cliente);
  COMMIT;
 
END PRC_INSERE_PEDIDO;