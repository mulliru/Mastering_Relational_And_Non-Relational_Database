# 📌 Aula 01 - Packages

Este documento contém um resumo dos principais conceitos abordados na **Aula 01** sobre **Packages em PL/SQL**, incluindo sua definição, vantagens, sintaxe e exemplos de implementação. 🚀

---  

## 📦 **1. O que é um Package em PL/SQL?**  

Um **Package** é um objeto de programação em **PL/SQL** que contém procedimentos, funções, variáveis e constantes relacionadas. Ele organiza funcionalidades e permite reutilização de código.  

📌 **Principais características:**  
- Permite agrupar **procedimentos e funções** em um único objeto.  
- **Facilita a reutilização** de código, evitando duplicação.  
- Melhora a **segurança e controle de acesso** às funções e procedimentos.  
- **Aprimora o desempenho**, pois os packages são armazenados em cache no banco.  
- **Facilita a manutenção**, pois alterações podem ser feitas no package sem modificar diretamente funções individuais.  

---

## 🏆 **2. Vantagens do Uso de Packages**  

1️⃣ **Modularidade** 🏗️ → Organiza funções e procedimentos de forma estruturada.  
2️⃣ **Reutilização** 🔄 → Reduz código duplicado, aumentando eficiência.  
3️⃣ **Controle de Acesso** 🔒 → Define funções públicas e privadas.  
4️⃣ **Melhoria de Desempenho** ⚡ → Armazena no cache do banco para processamento mais rápido.  
5️⃣ **Facilidade de Manutenção** 🔧 → Simplifica alterações na lógica de negócios.  
6️⃣ **Consistência** 🔁 → Garante que funções sigam um padrão em todo o sistema.  

---

## 💻 **3. Sintaxe de um Package em PL/SQL**  

📌 **Definição de um Package**  
```sql
CREATE [OR REPLACE] PACKAGE nome_do_package AS
    -- Declaração de variáveis públicas
    -- Declaração de tipos públicos
    -- Declaração de exceções públicas
    -- Declaração de procedimentos e funções públicas
END nome_do_package;
```

📌 **Implementação do Package (BODY)**  
```sql
CREATE [OR REPLACE] PACKAGE BODY nome_do_package AS
    -- Implementação de variáveis privadas
    -- Implementação de tipos privados
    -- Implementação de procedimentos e funções privadas
END nome_do_package;
```

---

## 🏗 **4. Exemplo Prático**  

Criando um **package** chamado `PKG_EXEMPLO`:  
```sql
CREATE OR REPLACE PACKAGE PKG_EXEMPLO AS
    v_count NUMBER := 0; -- Variável pública
    FUNCTION FUN_VALIDA_NOME2(p_nome IN VARCHAR2) RETURN BOOLEAN;
    PROCEDURE PRC_INSERE_PRODUTOS_NOVOS;
END PKG_EXEMPLO;
```

📌 **Chamando um procedimento dentro do package:**  
```sql
EXEC PKG_EXEMPLO.PRC_INSERE_PRODUTOS_NOVOS;
```

---

## 🏁 **5. Exercícios**  

📌 **1. Crie um Package com os seguintes objetos:**  
✅ Uma **procedure** para inserir valores na tabela **PAIS**, validando que o nome não pode conter números.  
✅ Uma **procedure** para inserir valores na tabela **ESTADO**, tratando erro de **chave primária violada**.  
✅ Chame a **procedure** dentro do package para inserir valores nas tabelas criadas.  
