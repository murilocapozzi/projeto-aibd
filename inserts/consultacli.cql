// Inserção de dados para a tabela ConsultCli, que se traduz em
// relacionamentos ATUA_EM entre Funcionário e Consultório.

MATCH (f:Funcionario {CodFunc: 11}), (c:Consultorio {CodConsult: 1})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 12}), (c:Consultorio {CodConsult: 2})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 13}), (c:Consultorio {CodConsult: 3})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 14}), (c:Consultorio {CodConsult: 4})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 15}), (c:Consultorio {CodConsult: 5})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 16}), (c:Consultorio {CodConsult: 6})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 17}), (c:Consultorio {CodConsult: 7})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 18}), (c:Consultorio {CodConsult: 8})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 19}), (c:Consultorio {CodConsult: 9})
MERGE (f)-[:ATUA_EM]->(c);

MATCH (f:Funcionario {CodFunc: 20}), (c:Consultorio {CodConsult: 10})
MERGE (f)-[:ATUA_EM]->(c);
