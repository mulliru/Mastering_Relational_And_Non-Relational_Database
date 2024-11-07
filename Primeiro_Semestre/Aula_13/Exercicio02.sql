/*
Quest�o 2: Fun��o para Calcular Total em Estoque de Produtos Ativos 
Descri��o: Desenvolva uma fun��o chamada calcular_estoque_total que retorna o estoque total dos produtos ativos. Lance uma exce��o se n�o houver produtos ativos. Use vari�veis para somar o estoque e um LOOP para iterar pelos produtos ativos.
Requisitos:
�	Exce��o: Lance uma exce��o se n�o houver produtos ativos.
�	JOIN: Utilize LEFT JOIN entre produto e estoque_produto.
�	LOOP: Itere pelos produtos ativos.
�	Vari�vel: Armazene o total de estoque.

- Lari
*/
CREATE OR REPLACE FUNCTION calcular_estoque_total
RETURN NUMBER IS
    total_estoque NUMBER := 0;
    produtos_ativos EXCEPTION;
BEGIN
    FOR produto IN (
        SELECT p.id, e.quantidade
        FROM produto p
        LEFT JOIN estoque_produto e ON p.id = e.produto_id
        WHERE p.ativo = "Ativo"
    ) LOOP
        IF produto.quantidade IS NOT NULL THEN
            total_estoque := total_estoque + produto.quantidade;
        END IF;
    END LOOP;

    IF total_estoque = 0 THEN
        RAISE produtos_ativos;
    END IF;

    RETURN total_estoque;

EXCEPTION
    WHEN produtos_ativos THEN
        RAISE_APPLICATION_ERROR(-20001, 'N�o h� produtos ativos em estoque');
END calcular_estoque_total;

