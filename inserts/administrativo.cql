// Inserção de dados para a tabela Administrativo, que se traduz em
// relacionamentos TRABALHA_EM entre Funcionário e Setor com a propriedade Cargo.

MATCH (f:Funcionario {CodFunc: 1}), (s:Setor {CodSet: 1})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Gerente'}]->(s);

MATCH (f:Funcionario {CodFunc: 2}), (s:Setor {CodSet: 2})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Analista'}]->(s);

MATCH (f:Funcionario {CodFunc: 3}), (s:Setor {CodSet: 3})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Gerente'}]->(s);

MATCH (f:Funcionario {CodFunc: 4}), (s:Setor {CodSet: 4})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Recepcionista'}]->(s);

MATCH (f:Funcionario {CodFunc: 5}), (s:Setor {CodSet: 5})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Analista'}]->(s);

MATCH (f:Funcionario {CodFunc: 6}), (s:Setor {CodSet: 6})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Supervisor'}]->(s);

MATCH (f:Funcionario {CodFunc: 7}), (s:Setor {CodSet: 7})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Coordenador'}]->(s);

MATCH (f:Funcionario {CodFunc: 8}), (s:Setor {CodSet: 8})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Analista'}]->(s);

MATCH (f:Funcionario {CodFunc: 9}), (s:Setor {CodSet: 9})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Analista'}]->(s);

MATCH (f:Funcionario {CodFunc: 10}), (s:Setor {CodSet: 10})
MERGE (f)-[:TRABALHA_EM {Cargo: 'Pesquisador'}]->(s);
