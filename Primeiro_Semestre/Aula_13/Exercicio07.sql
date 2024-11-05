/*
Questão 7: Procedimento para Atualizar Estoque de Produtos com Exceções
Descrição: Crie uma procedure chamada `atualizar_estoque_produto` que recebe o código de um produto e a quantidade a ser adicionada ao estoque. Caso o estoque final seja negativo, ajuste-o para zero e lance uma exceção. Utilize um LOOP para simular a atualização e um IF para verificar se o estoque final é negativo.

Requisitos:
- Exceção: Lance uma exceção se o estoque final for negativo.
- JOIN: Use INNER JOIN entre as tabelas `produto` e `estoque_produto`.
- LOOP: Simule a atualização repetida para cada unidade adicionada.
- IF: Verifique se o estoque final é negativo e ajuste, se necessário.

- Murillo
*/

CREATE OR REPLACE PROCEDURE atualizar_estoque_produto(p_cod_produto IN NUMBER, p_quantidade IN NUMBER) IS
    -- Variáveis para armazenar o estoque atual e o estoque final simulado
    v_estoque_atual NUMBER;
    v_estoque_final NUMBER;
BEGIN
    -- Recupera o estoque atual do produto com INNER JOIN
    SELECT ep.qtd_produto
    INTO v_estoque_atual
    FROM produto p
    INNER JOIN estoque_produto ep ON p.cod_produto = ep.cod_produto
    WHERE p.cod_produto = p_cod_produto;

    -- Inicializa o estoque final com o estoque atual
    v_estoque_final := v_estoque_atual;

    -- Loop para simular a adição de cada unidade ao estoque
    FOR i IN 1..p_quantidade LOOP
        v_estoque_final := v_estoque_final + 1;

        -- Verifica se o estoque final é negativo (apenas um ajuste simulado)
        IF v_estoque_final < 0 THEN
            v_estoque_final := 0;
            RAISE_APPLICATION_ERROR(-20003, 'Estoque final negativo. Ajustado para zero.');
        END IF;
    END LOOP;

    -- Atualiza o estoque no banco de dados
    UPDATE estoque_produto
    SET qtd_produto = v_estoque_final
    WHERE cod_produto = p_cod_produto;

    COMMIT;
END atualizar_estoque_produto;
/

