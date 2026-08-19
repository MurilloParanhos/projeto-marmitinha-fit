# 🍱 Marmitinha Fit - Data Analytics Project

Projeto desenvolvido para aplicar conceitos de **Banco de Dados e Análise de Dados** utilizando um cenário real: uma marmitaria fit.

O objetivo é organizar e analisar dados de clientes, pedidos, produtos e combos para gerar indicadores que possam auxiliar na tomada de decisão.

O projeto foi iniciado utilizando **SQLite** e posteriormente passou por uma migração para **PostgreSQL**, permitindo evoluir a estrutura do banco e aproximar o projeto de um ambiente profissional de dados.

---

# 📌 Objetivos

* Modelar um banco de dados relacional.
* Registrar clientes, marmitas, pedidos e combos.
* Criar consultas SQL para responder perguntas de negócio.
* Realizar validações de qualidade e consistência dos dados.
* Utilizar PostgreSQL como banco de dados principal.
* Automatizar análises utilizando Python e Pandas.
* Exportar e analisar dados no Excel.
* Construir dashboards no Power BI.

---

# 🛠 Tecnologias

### Banco de Dados e SQL

* PostgreSQL 18
* pgAdmin 4
* SQL
* SQLite *(utilizado na primeira versão do projeto)*

### Análise e Visualização

* Python *(em desenvolvimento)*
* Pandas *(em desenvolvimento)*
* Excel *(em desenvolvimento)*
* Power BI *(em desenvolvimento)*

### Versionamento

* Git
* GitHub

---

# 🗄 Estrutura do Banco

O banco de dados possui as seguintes tabelas:

* Clientes
* Marmitas
* Pedidos
* Itens_Pedidos
* Combos

Também possui **Views** para facilitar análises de negócio.

O banco foi inicialmente desenvolvido em SQLite e posteriormente migrado para PostgreSQL.

Durante a migração, alguns tipos de dados foram aprimorados, como:

* Valores monetários utilizando `NUMERIC(10,2)`.
* Datas utilizando o tipo `DATE`.
* Relacionamentos entre tabelas utilizando Primary Keys e Foreign Keys.

---

# 🔎 Qualidade dos Dados

Durante a migração para PostgreSQL, foi realizada uma etapa de **validação da qualidade dos dados**.

Foram utilizadas consultas SQL com:

* `JOIN`
* `LEFT JOIN`
* `SUM`
* `GROUP BY`
* `CASE WHEN`

A validação compara as quantidades registradas nos itens dos pedidos com os valores e combos cadastrados.

Foram identificadas inconsistências em alguns registros da base original. Os casos em que a correção pôde ser determinada com segurança foram ajustados.

Um pedido permaneceu identificado como inconsistente por não haver informação suficiente na base original para determinar quais itens estavam faltando. Nesse caso, o dado foi preservado em vez de criar informações sem evidência.

A consulta utilizada para essa análise está disponível em:

`Consultas_SQL/validacao_dados.sql`

---

# 📊 Análises Desenvolvidas

✔ Total de clientes

✔ Total de pedidos

✔ Total de marmitas vendidas

✔ Faturamento total

✔ Ticket médio

✔ Ranking das marmitas

✔ Pedidos por dia

✔ Combos x Pedidos avulsos

✔ Validação de consistência dos pedidos

---

# 📂 Estrutura do Projeto

```text
Projeto-Marmitinha-Git
│
├── Backups
│   └── Marmitinha_Fit_v1.db.sql
│
├── Consultas_SQL
│   ├── consultas.sql
│   ├── validacao_dados.sql
│   └── views.sql
│
└── README.md
```

Novas pastas serão adicionadas conforme o desenvolvimento das etapas de Python, Excel e Power BI.

---

# 🚀 Roadmap

## ✅ Versão 1.0 — SQLite

* [x] Modelagem do banco de dados
* [x] Banco de dados SQLite
* [x] Consultas SQL
* [x] Views
* [x] Documentação inicial

## ✅ Versão 2.0 — PostgreSQL

* [x] Migração de SQLite para PostgreSQL
* [x] Configuração do PostgreSQL 18
* [x] Utilização do pgAdmin 4
* [x] Adequação dos tipos de dados
* [x] Validação da qualidade dos dados
* [x] Identificação e tratamento de inconsistências

## 🔄 Próximas versões

* [ ] Integração com Python
* [ ] Manipulação e análise de dados com Pandas
* [ ] Análise dos dados no Excel
* [ ] Construção de dashboard no Power BI
* [ ] Criação de novos indicadores de negócio
* [ ] Publicação da versão final do projeto

---

# 📈 Objetivo do Projeto

Este projeto está sendo desenvolvido como parte dos meus estudos em **Análise de Dados**, utilizando um cenário de negócio para aplicar os conhecimentos adquiridos na prática.

A proposta é desenvolver um fluxo de análise de dados passando por diferentes etapas:

**Banco de Dados → SQL → Qualidade dos Dados → Python/Pandas → Excel → Power BI**

Dessa forma, o projeto evolui gradualmente enquanto novas ferramentas e conceitos de análise de dados são incorporados.

---

# 👨‍💻 Autor

**Murillo Paranhos**

Projeto desenvolvido para fins de estudo e construção de portfólio.
