/*
Questão 5: Procedimento para Listar Produtos em Estoque Acima de um Valor com Tratamento de Erros
Descrição: Crie uma procedure chamada `listar_produtos_em_estoque_minimo` que exibe produtos com estoque acima de um valor mínimo especificado. Caso não haja produtos com estoque suficiente, lance uma exceção. Utilize um LOOP para iterar sobre os produtos e um IF para verificar se a quantidade em estoque atende ao valor mínimo.

Requisitos:
- Exceção: Lance uma exceção se não houver produtos com estoque suficiente.
- JOIN: Use LEFT JOIN entre as tabelas `produto` e `estoque_produto`.
- LOOP: Utilize um loop para iterar sobre os produtos.
- IF: Verifique se a quantidade em estoque é superior ao valor mínimo especificado.

- Murillo
*/

CREATE OR REPLACE PROCEDURE listar_produtos_em_estoque_minimo(p_minimo IN NUMBER) IS
    -- Cursor para selecionar os produtos e estoques com LEFT JOIN
    CURSOR cur_produtos IS
        SELECT p.nome_produto, ep.quantidade_estoque
        FROM produto p
        LEFT JOIN estoque_produto ep ON p.cod_produto = ep.cod_produto;

    -- Variáveis para armazenar os dados do cursor
    v_nome_produto produto.nome_produto%TYPE;
    v_quantidade_estoque estoque_produto.quantidade_estoque%TYPE;

    -- Variável para controlar se algum produto foi encontrado
    v_encontrou BOOLEAN := FALSE;
BEGIN
    -- Abrindo o loop com o cursor
    FOR prod IN cur_produtos LOOP
        -- Verificação do estoque mínimo
        IF prod.quantidade_estoque > p_minimo THEN
            DBMS_OUTPUT.PUT_LINE('Produto: ' || prod.nome_produto || ' | Quantidade em Estoque: ' || prod.quantidade_estoque);
            v_encontrou := TRUE;
        END IF;
    END LOOP;

    -- Lançamento de exceção se nenhum produto atender ao valor mínimo
    IF NOT v_encontrou THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nenhum produto com estoque acima do valor mínimo especificado.');
    END IF;
END listar_produtos_em_estoque_minimo;
/
