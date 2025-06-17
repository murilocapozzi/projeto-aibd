// Inserção de dados para a entidade Setor e criação do relacionamento GERENCIADO_POR
// Usamos MERGE para o nó Setor para criar se não existir e corresponder se existir.
// Usamos MATCH para encontrar o Funcionário correspondente e então criar o relacionamento.

MERGE (s1:Setor {CodSet: 1})
ON CREATE SET s1.NomeSet = 'Administrativo', s1.Local = 'Bloco A'
WITH s1
MATCH (f1:Funcionario {CodFunc: 1})
MERGE (s1)-[:GERENCIADO_POR]->(f1);

MERGE (s2:Setor {CodSet: 2})
ON CREATE SET s2.NomeSet = 'Financeiro', s2.Local = 'Bloco B'
WITH s2
MATCH (f2:Funcionario {CodFunc: 2})
MERGE (s2)-[:GERENCIADO_POR]->(f2);

MERGE (s3:Setor {CodSet: 3})
ON CREATE SET s3.NomeSet = 'Recursos Humanos', s3.Local = 'Bloco C'
WITH s3
MATCH (f3:Funcionario {CodFunc: 3})
MERGE (s3)-[:GERENCIADO_POR]->(f3);

MERGE (s4:Setor {CodSet: 4})
ON CREATE SET s4.NomeSet = 'Recepção', s4.Local = 'Hall'
WITH s4
MATCH (f4:Funcionario {CodFunc: 4})
MERGE (s4)-[:GERENCIADO_POR]->(f4);

MERGE (s5:Setor {CodSet: 5})
ON CREATE SET s5.NomeSet = 'Des. de Disp. Biom.', s5.Local = 'Bloco D'
WITH s5
MATCH (f5:Funcionario {CodFunc: 5})
MERGE (s5)-[:GERENCIADO_POR]->(f5);

MERGE (s6:Setor {CodSet: 6})
ON CREATE SET s6.NomeSet = 'Tec. da Inf.', s6.Local = 'Bloco E'
WITH s6
MATCH (f6:Funcionario {CodFunc: 6})
MERGE (s6)-[:GERENCIADO_POR]->(f6);

MERGE (s7:Setor {CodSet: 7})
ON CREATE SET s7.NomeSet = 'Suporte Técnico', s7.Local = 'Bloco F'
WITH s7
MATCH (f7:Funcionario {CodFunc: 7})
MERGE (s7)-[:GERENCIADO_POR]->(f7);

MERGE (s8:Setor {CodSet: 8})
ON CREATE SET s8.NomeSet = 'Projetos', s8.Local = 'Bloco G'
WITH s8
MATCH (f8:Funcionario {CodFunc: 8})
MERGE (s8)-[:GERENCIADO_POR]->(f8);

MERGE (s9:Setor {CodSet: 9})
ON CREATE SET s9.NomeSet = 'Manut. de Equip. Méd', s9.Local = 'Bloco H'
WITH s9
MATCH (f9:Funcionario {CodFunc: 9})
MERGE (s9)-[:GERENCIADO_POR]->(f9);

MERGE (s10:Setor {CodSet: 10})
ON CREATE SET s10.NomeSet = 'Pesq. em Eng. Biom.', s10.Local = 'Bloco I'
WITH s10
MATCH (f10:Funcionario {CodFunc: 10})
MERGE (s10)-[:GERENCIADO_POR]->(f10);