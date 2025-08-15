# Demonstração de Criação e Gerenciamento de Tablespace no Oracle

Este projeto demonstra, de forma prática, como criar, gerenciar e utilizar uma **tablespace** no Oracle Database.

## Objetivo
Mostrar conhecimentos de:
- Criação de tablespace (`CREATE TABLESPACE`)
- Criação de usuário com tablespace padrão (`CREATE USER`)
- Concessão de permissões (`GRANT`)
- Criação de objetos e inserção de dados
- Verificação de alocação de objetos
- Alteração e expansão de tablespace (`ALTER DATABASE ADD DATAFILE`)

## Estrutura
- **tablespace_demo.sql** → Script SQL comentado, pronto para ser executado no Oracle.
- **prints/** → Pasta para armazenar capturas de tela do SQL Developer mostrando a execução dos comandos.

## Passos para execução
1. Conectar como usuário com privilégios administrativos (`SYS` ou `SYSTEM`).
2. Executar o script `tablespace_demo.sql` no SQL Developer ou SQL*Plus.
3. Verificar resultados com:
   ```sql
   SELECT tablespace_name, file_name, bytes/1024/1024 AS tamanho_MB
   FROM dba_data_files;
