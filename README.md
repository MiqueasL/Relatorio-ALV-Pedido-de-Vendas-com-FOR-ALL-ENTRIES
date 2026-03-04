# Relatorio-ALV-Pedido-de-Vendas-com-FOR-ALL-ENTRIES

Relatório ABAP – Leitura de Pedidos de Venda (VBAK / VBAP)

Este programa em ABAP Clássico realiza a leitura de pedidos de venda utilizando as tabelas padrão do SAP:

VBAK – Dados de cabeçalho do pedido

VBAP – Dados de itens do pedido

O relatório permite filtrar os pedidos com base em critérios informados pelo usuário e realiza o processamento manual dos dados para cálculo de totais.

Filtros de Seleção

O programa permite filtrar pedidos por:

Número do pedido (VBELN)

Data de criação (ERDAT)

São utilizados SELECT-OPTIONS, permitindo múltiplos valores e intervalos:

s_vbeln

s_erdat

Lógica do Programa

Leitura de Cabeçalhos (VBAK) É realizada uma consulta na tabela VBAK com base nos filtros informados. Os dados são armazenados em uma tabela interna para posterior processamento.

Leitura de Itens (VBAP) Caso existam pedidos encontrados:

É executado um SELECT ... FOR ALL ENTRIES na tabela VBAP

São buscados apenas os itens correspondentes aos pedidos selecionados

Essa abordagem:

Evita múltiplos acessos ao banco de dados

Melhora a performance

Segue boas práticas de leitura em massa no ABAP clássico

Processamento e Agregação O programa realiza:

Ordenação dos itens por VBELN

Utilização de READ TABLE ... BINARY SEARCH para localizar rapidamente o primeiro item do pedido

Percurso sequencial dos itens correspondentes ao mesmo pedido

Durante o processamento, são calculados:

Quantidade total de itens

Valor total do pedido (NETWR)

A agregação é feita manualmente, sem uso de GROUP BY.

Saída do Relatório

Para cada pedido, o relatório exibe:

Número do pedido

Cliente

Total de itens

Valor total do pedido em moeda BRL

Conceitos Técnicos Aplicados

SELECT-OPTIONS

SELECT ... INTO TABLE

FOR ALL ENTRIES

BINARY SEARCH

Controle com sy-subrc

Processamento manual de agregação

Uso de tabelas internas

Controle por índice (sy-tabix)

Técnicas de performance em ABAP clássico

Objetivo Técnico

O objetivo deste desenvolvimento é praticar:

Leitura otimizada de dados em tabelas relacionadas (Header × Item)

Processamento eficiente com BINARY SEARCH

Técnicas de performance em ABAP Clássico

Cálculo manual de totais sem utilização de GROUP BY
<img width="876" height="282" alt="557872112-fb68730e-1cf1-413b-89f1-95af8a63535f" src="https://github.com/user-attachments/assets/f4cd16e1-65a4-4178-a793-f7aecd1b33be" />
<img width="518" height="764" alt="557872124-f3457ff6-0114-44f4-b89c-f23c64243f22" src="https://github.com/user-attachments/assets/b0fa9a9e-79ec-413b-ba86-3b6c2314a542" />
