// Inserção de dados para a tabela Estoque, que se traduz em
// relacionamentos TEM_ESTOQUE_DA_UNIDADE entre RemedioUnidade e Remedio, com as propriedades DataCompra e Quantidade.

MATCH (ru:RemedioUnidade {CodUnid: 1}), (r:Remedio {CodRem: 1})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-10'), Quantidade: 50}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 2}), (r:Remedio {CodRem: 2})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-12'), Quantidade: 100}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 3}), (r:Remedio {CodRem: 3})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-15'), Quantidade: 75}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 4}), (r:Remedio {CodRem: 4})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-18'), Quantidade: 30}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 5}), (r:Remedio {CodRem: 5})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-20'), Quantidade: 60}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 6}), (r:Remedio {CodRem: 6})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-22'), Quantidade: 40}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 7}), (r:Remedio {CodRem: 7})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-25'), Quantidade: 90}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 8}), (r:Remedio {CodRem: 8})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-28'), Quantidade: 110}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 9}), (r:Remedio {CodRem: 9})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-01-30'), Quantidade: 20}]->(r);

MATCH (ru:RemedioUnidade {CodUnid: 10}), (r:Remedio {CodRem: 10})
MERGE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {DataCompra: date('2025-02-01'), Quantidade: 35}]->(r);
