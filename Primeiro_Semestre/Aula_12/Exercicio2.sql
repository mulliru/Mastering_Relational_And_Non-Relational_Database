--2) Fa�a um procedimento chamado PRC_VALIDA_TOTAL PEDIDO que receba como parametro o c�digo do pedido e que utilize dois cursores, um para 
--localizar o pedido e outro para acessar os itens deste pedido, fazendo a soma dos itens e ao final verificar se a soma dos
--itens (quantidade pre�o unit�rio) - desconto � igual ao total do pedido Caso os valores coincidam retorne pelo 
--parametro p_retorno a mensagem "pedido ok, caso contrario retome "total dos itens n�o coincide com valor total do pedido

DECLARE
    CURSOR PRC_VALIDA_TOTAL IS
        
    


--3) Fa�a um procedimento chamado PRC_DELETA_PEDIDO que receba como parametro o numero do pedido e que antes de excluir o 
--pedido execute um cursor na tabela de itens de pedido e fa�a o delete de cada um deles usando a t�cnica de ROWID