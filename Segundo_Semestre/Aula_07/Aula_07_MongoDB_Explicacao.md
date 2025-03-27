# 📌 Aula 07 - Explicação Simplificada: NoSQL e MongoDB

Este é um resumo explicativo em linguagem simples sobre os principais tópicos abordados na Aula 07: **NoSQL**, **MongoDB**, **MongoDB Compass** e **comandos básicos com MongoSH**. Ideal para revisões rápidas! 🚀

---

## 🔍 O que é NoSQL?

- **NoSQL** significa “Not Only SQL” (não só SQL).
- Surgiu para resolver problemas dos bancos tradicionais quando o volume de dados ficou gigante (ex: redes sociais, big data).
- Ideal quando você precisa de **flexibilidade**, **velocidade** e **escalabilidade**.

---

## 🗃️ Tipos de Banco NoSQL (com exemplos)

| Tipo         | Quando Usar                            | Exemplos                     |
|--------------|----------------------------------------|------------------------------|
| Chave-Valor  | Sessão de usuário, cache               | Redis, DynamoDB              |
| Colunar      | BI, análise de dados                   | Cassandra, HBase             |
| Grafos       | Redes sociais, recomendações           | Neo4j, Amazon Neptune        |
| Documentos   | CMS, dados flexíveis, IoT              | MongoDB, CouchDB             |

---

## ⚖️ ACID x BASE

| ACID (Relacional)        | BASE (NoSQL)                  |
|--------------------------|-------------------------------|
| 100% consistente e seguro| Funciona quase sempre, mas é rápido |
| Lento com muitos dados   | Mais leve e escalável         |

---

## 🔺 Teorema CAP (modo simples)

Você só pode escolher **2 dos 3** abaixo:

- **C**: Consistência (dados iguais em todos os lugares)
- **A**: Disponibilidade (sistema sempre no ar)
- **P**: Tolerância a falhas (mesmo com problemas na rede)

Ex: MongoDB escolhe **C + P**

---

## 🍃 O que é MongoDB?

- Banco de dados **NoSQL orientado a documentos**.
- Usa documentos tipo **JSON** ao invés de tabelas.
- Super usado em apps modernos.
- Flexível, rápido e escalável.

---

## 🧭 MongoDB Compass

- Ferramenta visual para trabalhar com MongoDB.
- Permite:
  - Ver os dados
  - Fazer buscas
  - Criar bancos, coleções e documentos
  - Importar e exportar dados

---

## 💻 Comandos MongoDB (resumão)

```js
// Criar banco e coleção
use loja
db.createCollection("produtos")

// Inserir produtos
db.produtos.insertOne({ nome: "Produto A", preco: 20, categoria: "Eletrônicos" })

// Buscar todos os produtos
db.produtos.find()

// Atualizar preço
db.produtos.updateOne({ nome: "Produto A" }, { $set: { preco: 25 } })

// Deletar produto
db.produtos.deleteOne({ nome: "Produto A" })

// Ordenar e limitar
db.produtos.find().sort({ nome: 1 }).limit(3)
```

---

## 🧪 Exercícios comuns

- Criar banco e coleção
- Inserir vários produtos (`insertMany`)
- Atualizar preço ou categoria
- Buscar nome e categoria
- Deletar produto
- Ordenar produtos
- Criar índices

---

## ✅ Conclusão

O MongoDB é uma **ótima opção quando você precisa de velocidade, flexibilidade e trabalhar com grandes volumes de dados**. E ainda é fácil de usar com comandos simples ou pelo Compass!

