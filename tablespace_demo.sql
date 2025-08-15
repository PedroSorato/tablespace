-- =====================================================================
-- Projeto: Demonstração de Criação e Gerenciamento de Tablespace no Oracle
-- Objetivo: Mostrar criação, uso e gerenciamento de uma tablespace
-- =====================================================================

-- 1) Criando tablespace 'vendas_tbs'
CREATE TABLESPACE vendas_tbs
DATAFILE 'C:/app/oracle/oradata/ORCL1/vendas01.dbf'
SIZE 50M
AUTOEXTEND ON
NEXT 5M
MAXSIZE 100M;
-- Explicação:
-- SIZE = tamanho inicial
-- AUTOEXTEND = crescimento automático
-- NEXT = incremento no crescimento
-- MAXSIZE = limite máximo

-- 2) Criando usuário com tablespace padrão 'vendas_tbs'
CREATE USER pedro IDENTIFIED BY senhacomplexa
DEFAULT TABLESPACE vendas_tbs
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON vendas_tbs;
-- Explicação:
-- DEFAULT TABLESPACE = onde os objetos serão criados por padrão
-- TEMPORARY TABLESPACE = usado para operações temporárias
-- QUOTA = permissão de uso de espaço nessa tablespace

-- 3) Concededendo permissões básicas ao usuário
GRANT CONNECT, RESOURCE TO pedro;

-- 4) Conectando como usuário 'pedro'
CONNECT pedro/senhacomplexa;

-- 5) Criando tabela 'produtos'
CREATE TABLE produtos (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    preco NUMBER(10,2)
);

-- 6) Inserindo dados na tabela
INSERT INTO produtos VALUES (1, 'Teclado Mecânico', 250.00);
INSERT INTO produtos VALUES (2, 'Mouse Gamer', 150.00);
COMMIT;

-- 7) Verificando em qual tablespace a tabela foi criada
SELECT table_name, tablespace_name
FROM user_tables
WHERE table_name = 'PRODUTOS';

-- 8) Adicionando mais um datafile à tablespace
ALTER DATABASE ADD DATAFILE 'C:/app/oracle/oradata/ORCL1/vendas02.dbf'
SIZE 30M AUTOEXTEND ON;

-- 9) Removendo o usuário e tablespace para limpar ambiente
-- DROP USER pedro CASCADE;
-- DROP TABLESPACE vendas_tbs INCLUDING CONTENTS AND DATAFILES;
