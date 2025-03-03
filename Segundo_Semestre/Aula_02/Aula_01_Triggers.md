# 📌 Aula 01 - Triggers  

Este documento contém um resumo dos principais conceitos abordados na **Aula 01** sobre **Triggers em PL/SQL**, incluindo definição, tipos, sintaxe e exemplos. 🚀  

---  

## 🔥 **1. O que é uma Trigger em PL/SQL?**  

Uma **Trigger** é um **gatilho** que dispara automaticamente em resposta a eventos específicos no banco de dados.  

📌 **Principais usos:**  
- **Automatização** de processos repetitivos.  
- **Regras de negócio** aplicadas automaticamente.  
- **Garantia de integridade** da base de dados.  
- **Auditoria de alterações** feitas nas tabelas.  

---

## 🎯 **2. Tipos de Triggers**  

📌 **BEFORE** 🕒 → Executa **antes** da ação (INSERT, UPDATE, DELETE).  
📌 **AFTER** ⏳ → Executa **depois** da ação.  
📌 **INSTEAD OF** 🚀 → Intercepta comandos DML em **views** e executa código PL/SQL no lugar da ação.  

---

## 💻 **3. Sintaxe de uma Trigger**  

📌 **Criação de uma Trigger básica**  
```sql
CREATE OR REPLACE TRIGGER nome_da_trigger
BEFORE | AFTER | INSTEAD OF
[INSERT | UPDATE | DELETE] ON nome_tabela
FOR EACH ROW
BEGIN
    -- Lógica da trigger
END;
```

---

## 🏗 **4. Exemplos de Triggers**  

📌 **1. Atualizar Status de Pedido**  
```sql
CREATE OR REPLACE TRIGGER trg_pedido
BEFORE INSERT ON PEDIDO_NOVOS
FOR EACH ROW
BEGIN
    IF :NEW.STATUS IS NULL THEN
        :NEW.STATUS := 'Novo Pedido';
    END IF;
END;
```

📌 **2. Auditoria de Modificações**  
```sql
CREATE OR REPLACE TRIGGER trg_auditoria
AFTER INSERT OR UPDATE OR DELETE ON pedido_novos
FOR EACH ROW
DECLARE
    operacao VARCHAR2(30);
    nome_usuario VARCHAR2(100);
BEGIN
    IF INSERTING THEN operacao := 'INSERT';
    ELSIF UPDATING THEN operacao := 'UPDATE';
    ELSIF DELETING THEN operacao := 'DELETE';
    END IF;

    nome_usuario := SYS_CONTEXT('USERENV', 'SESSION_USER');

    INSERT INTO TB_AUDITORIA (tabela, operacao, DATA, USUARIO)
    VALUES ('PEDIDO_NOVOS', operacao, sysdate, nome_usuario);
END;
```

---

## 🏁 **5. Exercícios**  

📌 **1. Crie uma trigger para registrar alterações na data de entrega de pedidos.**  
📌 **2. Crie uma trigger que verifica o total de itens em um pedido e, caso seja maior que 20, aplique um desconto de 20%.**  
📌 **3. Crie uma trigger na tabela de clientes para validar se CPF/CNPJ contém apenas valores numéricos.**  
