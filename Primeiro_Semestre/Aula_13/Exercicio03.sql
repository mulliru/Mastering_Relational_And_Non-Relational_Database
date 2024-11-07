/*
Questï¿½o 3: Procedure para Atualizar Preï¿½o de Produtos para um Estado com Controle de Erros
Descriï¿½ï¿½o: Crie uma procedure chamada atualizar_preco_estado que aumenta o preï¿½o dos produtos comprados por clientes de um estado especï¿½fico. Se o estado nï¿½o tiver clientes, lance uma exceï¿½ï¿½o. Utilize um WHILE para iterar sobre os produtos e um IF para verificar se o produto estï¿½ ativo.
Requisitos:
ï¿½	Exceï¿½ï¿½o: Lance uma exceï¿½ï¿½o caso o estado nï¿½o tenha clientes.
ï¿½	JOIN: Use INNER JOIN entre cliente e produto.
ï¿½	WHILE: Utilize WHILE para iterar sobre os produtos.
ï¿½	IF: Verifique se o produto estï¿½ ativo antes de aplicar o ajuste.

- Lari
*/
CREATE OR REPLACE PROCEDURE atualizar_preco_produto_estado (
    p_cod_estado IN VARCHAR2,
    aumento_percentual IN NUMBER
) IS
    -- Variáveis para armazenar dados dos produtos
    v_produto_id NUMBER;
    v_preco_atual NUMBER;
    v_ativo CHAR(1);
    
    -- Variável para controlar a iteração dos produtos
    v_produto_encontrado BOOLEAN := TRUE;
    
    -- Variável para contar se houve consumidores ou não
    v_consumidores INTEGER := 0;

BEGIN
    -- Inicializa o v_produto_id com o primeiro produto válido (menor id)
    SELECT MIN(p.id)
    INTO v_produto_id
    FROM produto p
    INNER JOIN compra cp ON p.id = cp.produto_id
    INNER JOIN cliente cl ON cl.id = cp.cliente_id
    INNER JOIN Endereco_Cliente ec ON ec.cod_cliente = cl.id
    INNER JOIN Cidade c ON c.cod_cidade = ec.cod_cidade
    INNER JOIN Estado e ON e.cod_estado = c.cod_estado
    WHERE e.nome_estado = p_cod_estado
    AND p.ativo = 'S';

    -- Verificar se existem produtos para atualizar
    IF v_produto_id IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não há produtos ativos comprados neste estado.');
    END IF;

    -- Loop para iterar sobre os produtos
    WHILE v_produto_encontrado LOOP
        BEGIN
            -- Buscar o próximo produto após v_produto_id
            SELECT p.id, p.preco, p.ativo
            INTO v_produto_id, v_preco_atual, v_ativo
            FROM produto p
            INNER JOIN compra cp ON p.id = cp.produto_id
            INNER JOIN cliente cl ON cl.id = cp.cliente_id
            INNER JOIN Endereco_Cliente ec ON ec.cod_cliente = cl.id
            INNER JOIN Cidade c ON c.cod_cidade = ec.cod_cidade
            INNER JOIN Estado e ON e.cod_estado = c.cod_estado
            WHERE e.nome_estado = p_cod_estado
            AND p.ativo = 'S'
            AND p.id > v_produto_id -- Buscar o próximo produto com id maior
            ORDER BY p.id
            -- Aqui estamos apenas fazendo a consulta para o próximo produto ativo.

            -- Verificar se o produto está ativo
            IF v_ativo = 'S' THEN
                -- Atualizar o preço do produto
                UPDATE produto
                SET preco = v_preco_atual + (v_preco_atual * aumento_percentual / 100)
                WHERE id = v_produto_id;
                
                -- Incrementar o contador de consumidores
                v_consumidores := v_consumidores + 1;
            END IF;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- Caso não encontre mais produtos, sai do loop
                v_produto_encontrado := FALSE;
        END;
    END LOOP;

    -- Se não houver consumidores no estado, lançar exceção
    IF v_consumidores = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não há consumidores para os produtos no estado especificado.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Preços dos produtos no estado ' || p_cod_estado || ' foram atualizados com sucesso.');

EXCEPTION
    WHEN OTHERS THEN
        -- Caso ocorra qualquer erro, fazer rollback e lançar exceção
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20002, 'Erro ao atualizar os preços dos produtos: ' || SQLERRM);
END atualizar_preco_produto_estado;


