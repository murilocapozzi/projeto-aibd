// Inserção de dados para a entidade Consultorio e criação do relacionamento SUPERVISIONADO_POR
// Usamos MERGE para o nó Consultorio para criar se não existir e corresponder se existir.
// Usamos MATCH para encontrar o Funcionário correspondente e então criar o relacionamento.

MERGE (c1:Consultorio {CodConsult: 1})
ON CREATE SET c1.Sala = '101', c1.Descricao = 'Consultório de Cardiologia'
WITH c1
MATCH (f11:Funcionario {CodFunc: 11})
MERGE (c1)-[:SUPERVISIONADO_POR]->(f11);

MERGE (c2:Consultorio {CodConsult: 2})
ON CREATE SET c2.Sala = '102', c2.Descricao = 'Consultório de Pediatria'
WITH c2
MATCH (f12:Funcionario {CodFunc: 12})
MERGE (c2)-[:SUPERVISIONADO_POR]->(f12);

MERGE (c3:Consultorio {CodConsult: 3})
ON CREATE SET c3.Sala = '103', c3.Descricao = 'Consultório de Ortopedia'
WITH c3
MATCH (f13:Funcionario {CodFunc: 13})
MERGE (c3)-[:SUPERVISIONADO_POR]->(f13);

MERGE (c4:Consultorio {CodConsult: 4})
ON CREATE SET c4.Sala = '104', c4.Descricao = 'Consultório de Dermatologia'
WITH c4
MATCH (f14:Funcionario {CodFunc: 14})
MERGE (c4)-[:SUPERVISIONADO_POR]->(f14);

MERGE (c5:Consultorio {CodConsult: 5})
ON CREATE SET c5.Sala = '105', c5.Descricao = 'Consultório de Gastroenterologia'
WITH c5
MATCH (f15:Funcionario {CodFunc: 15})
MERGE (c5)-[:SUPERVISIONADO_POR]->(f15);

MERGE (c6:Consultorio {CodConsult: 6})
ON CREATE SET c6.Sala = '106', c6.Descricao = 'Consultório de Neurologia'
WITH c6
MATCH (f16:Funcionario {CodFunc: 16})
MERGE (c6)-[:SUPERVISIONADO_POR]->(f16);

MERGE (c7:Consultorio {CodConsult: 7})
ON CREATE SET c7.Sala = '107', c7.Descricao = 'Consultório de Psiquiatria'
WITH c7
MATCH (f17:Funcionario {CodFunc: 17})
MERGE (c7)-[:SUPERVISIONADO_POR]->(f17);

MERGE (c8:Consultorio {CodConsult: 8})
ON CREATE SET c8.Sala = '108', c8.Descricao = 'Consultório de Oftalmologia'
WITH c8
MATCH (f18:Funcionario {CodFunc: 18})
MERGE (c8)-[:SUPERVISIONADO_POR]->(f18);

MERGE (c9:Consultorio {CodConsult: 9})
ON CREATE SET c9.Sala = '109', c9.Descricao = 'Consultório de Ginecologia'
WITH c9
MATCH (f19:Funcionario {CodFunc: 19})
MERGE (c9)-[:SUPERVISIONADO_POR]->(f19);

MERGE (c10:Consultorio {CodConsult: 10})
ON CREATE SET c10.Sala = '110', c10.Descricao = 'Consultório de Anestesiologia'
WITH c10
MATCH (f20:Funcionario {CodFunc: 20})
MERGE (c10)-[:SUPERVISIONADO_POR]->(f20);
