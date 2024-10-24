DROP TABLE historico; -- Remove a tabela 'historico' se existir

CREATE TABLE historico(
    cod_produto NUMBER, -- Código do produto
    nome_produto VARCHAR(50), -- Nome do produto
    dat_movimentacao DATE -- Data da movimentação
);

DECLARE 
    v_codigo produto.cod_produto%TYPE := 12349; -- Código do produto
    CURSOR cur_emp is
    SELECT nom_produto FROM produto WHERE cod_produto = v_codigo; -- Cursor para buscar o nome do produto
    
BEGIN
    FOR x IN cur_emp LOOP
        -- Insere dados na tabela 'historico'
        INSERT INTO historico VALUES (v_codigo, x.nom_produto, sysdate);
        COMMIT; -- Salva as mudanças
    END LOOP;
END;
