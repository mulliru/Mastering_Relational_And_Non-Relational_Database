create table PRODUTOS_NOVOS as select * from tb_vendas where 1=1;


CALL PKG_EXEMPLO.PRC_INSERE_PRODUTOS_NOVOS()

SELECT * FROM produtos_novos

truncate table produtos_novos
                                            
CALL PKG_EXEMPLO.PRC_INSERE_pedido(10010, 5555, 55888, 5555, 6658,
                                            sysdate, sysdate + 10, sysdate + 1, 20000, 5,
                                            55544)

                                  
select * from pedidos_novos