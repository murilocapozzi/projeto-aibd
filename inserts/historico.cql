// Inserção de dados para a entidade Historico e criação do relacionamento REGISTRADO_POR
// Usamos MERGE para o nó Historico para criar se não existir e corresponder se existir.
// Usamos MATCH para encontrar o Funcionário correspondente e então criar o relacionamento.

MERGE (h1:Historico {CodHist: 1})
ON CREATE SET h1.Descricao = 'Funcionário ativo no setor administrativo.', h1.STATUS = 'Ativo', h1.Data_ini = date('2023-01-01')
WITH h1
MATCH (f1:Funcionario {CodFunc: 1})
MERGE (h1)-[:REGISTRADO_POR]->(f1);

MERGE (h2:Historico {CodHist: 2})
ON CREATE SET h2.Descricao = 'Funcionário inativo durante período de férias.', h2.STATUS = 'Inativo', h2.Data_ini = date('2025-01-10'), h2.Data_fim = date('2025-01-25')
WITH h2
MATCH (f2:Funcionario {CodFunc: 2})
MERGE (h2)-[:REGISTRADO_POR]->(f2);

MERGE (h3:Historico {CodHist: 3})
ON CREATE SET h3.Descricao = 'Funcionário inativo por licença médica.', h3.STATUS = 'Inativo', h3.Data_ini = date('2024-12-01'), h3.Data_fim = date('2025-01-15')
WITH h3
MATCH (f3:Funcionario {CodFunc: 3})
MERGE (h3)-[:REGISTRADO_POR]->(f3);

MERGE (h4:Historico {CodHist: 4})
ON CREATE SET h4.Descricao = 'Funcionário inativo após demissão.', h4.STATUS = 'Inativo', h4.Data_ini = date('2020-05-01'), h4.Data_fim = date('2020-05-01')
WITH h4
MATCH (f4:Funcionario {CodFunc: 4})
MERGE (h4)-[:REGISTRADO_POR]->(f4);

MERGE (h5:Historico {CodHist: 5})
ON CREATE SET h5.Descricao = 'Funcionário ativo no setor de trauma.', h5.STATUS = 'Ativo', h5.Data_ini = date('2022-01-01')
WITH h5
MATCH (f5:Funcionario {CodFunc: 5})
MERGE (h5)-[:REGISTRADO_POR]->(f5);

MERGE (h6:Historico {CodHist: 6})
ON CREATE SET h6.Descricao = 'Funcionário inativo durante período de férias.', h6.STATUS = 'Inativo', h6.Data_ini = date('2024-12-20'), h6.Data_fim = date('2025-01-10')
WITH h6
MATCH (f6:Funcionario {CodFunc: 6})
MERGE (h6)-[:REGISTRADO_POR]->(f6);

MERGE (h7:Historico {CodHist: 7})
ON CREATE SET h7.Descricao = 'Funcionário inativo por licença maternidade.', h7.STATUS = 'Inativo', h7.Data_ini = date('2024-09-01'), h7.Data_fim = date('2025-03-01')
WITH h7
MATCH (f7:Funcionario {CodFunc: 7})
MERGE (h7)-[:REGISTRADO_POR]->(f7);

MERGE (h8:Historico {CodHist: 8})
ON CREATE SET h8.Descricao = 'Funcionário ativo no setor do berçário.', h8.STATUS = 'Ativo', h8.Data_ini = date('2023-06-01')
WITH h8
MATCH (f8:Funcionario {CodFunc: 8})
MERGE (h8)-[:REGISTRADO_POR]->(f8);

MERGE (h9:Historico {CodHist: 9})
ON CREATE SET h9.Descricao = 'Funcionário inativo após demissão.', h9.STATUS = 'Inativo', h9.Data_ini = date('2021-03-15'), h9.Data_fim = date('2021-03-15')
WITH h9
MATCH (f9:Funcionario {CodFunc: 9})
MERGE (h9)-[:REGISTRADO_POR]->(f9);

MERGE (h10:Historico {CodHist: 10})
ON CREATE SET h10.Descricao = 'Funcionário ativo no setor de oncologia.', h10.STATUS = 'Ativo', h10.Data_ini = date('2022-07-01')
WITH h10
MATCH (f10:Funcionario {CodFunc: 10})
MERGE (h10)-[:REGISTRADO_POR]->(f10);

MERGE (h11:Historico {CodHist: 11})
ON CREATE SET h11.Descricao = 'Funcionário ativo no setor financeiro.', h11.STATUS = 'Ativo', h11.Data_ini = date('2023-01-15')
WITH h11
MATCH (f11:Funcionario {CodFunc: 11})
MERGE (h11)-[:REGISTRADO_POR]->(f11);

MERGE (h12:Historico {CodHist: 12})
ON CREATE SET h12.Descricao = 'Funcionário inativo após projeto concluído.', h12.STATUS = 'Inativo', h12.Data_ini = date('2022-06-01'), h12.Data_fim = date('2023-06-01')
WITH h12
MATCH (f12:Funcionario {CodFunc: 12})
MERGE (h12)-[:REGISTRADO_POR]->(f12);

MERGE (h13:Historico {CodHist: 13})
ON CREATE SET h13.Descricao = 'Funcionário ativo na recepção.', h13.STATUS = 'Ativo', h13.Data_ini = date('2024-02-01')
WITH h13
MATCH (f13:Funcionario {CodFunc: 13})
MERGE (h13)-[:REGISTRADO_POR]->(f13);

MERGE (h14:Historico {CodHist: 14})
ON CREATE SET h14.Descricao = 'Funcionário inativo após término do contrato.', h14.STATUS = 'Inativo', h14.Data_ini = date('2021-05-01'), h14.Data_fim = date('2021-05-31')
WITH h14
MATCH (f14:Funcionario {CodFunc: 14})
MERGE (h14)-[:REGISTRADO_POR]->(f14);

MERGE (h15:Historico {CodHist: 15})
ON CREATE SET h15.Descricao = 'Funcionário ativo no setor de TI.', h15.STATUS = 'Ativo', h15.Data_ini = date('2023-09-01')
WITH h15
MATCH (f15:Funcionario {CodFunc: 15})
MERGE (h15)-[:REGISTRADO_POR]->(f15);

MERGE (h16:Historico {CodHist: 16})
ON CREATE SET h16.Descricao = 'Funcionário inativo por licença médica.', h16.STATUS = 'Inativo', h16.Data_ini = date('2024-03-01'), h16.Data_fim = date('2024-06-01')
WITH h16
MATCH (f16:Funcionario {CodFunc: 16})
MERGE (h16)-[:REGISTRADO_POR]->(f16);

MERGE (h17:Historico {CodHist: 17})
ON CREATE SET h17.Descricao = 'Funcionário ativo no setor jurídico.', h17.STATUS = 'Ativo', h17.Data_ini = date('2023-11-01')
WITH h17
MATCH (f17:Funcionario {CodFunc: 17})
MERGE (h17)-[:REGISTRADO_POR]->(f17);

MERGE (h18:Historico {CodHist: 18})
ON CREATE SET h18.Descricao = 'Funcionário inativo após término do contrato.', h18.STATUS = 'Inativo', h18.Data_ini = date('2021-07-01'), h18.Data_fim = date('2021-07-31')
WITH h18
MATCH (f18:Funcionario {CodFunc: 18})
MERGE (h18)-[:REGISTRADO_POR]->(f18);

MERGE (h19:Historico {CodHist: 19})
ON CREATE SET h19.Descricao = 'Funcionário ativo no setor de marketing.', h19.STATUS = 'Ativo', h19.Data_ini = date('2022-10-01')
WITH h19
MATCH (f19:Funcionario {CodFunc: 19})
MERGE (h19)-[:REGISTRADO_POR]->(f19);

MERGE (h20:Historico {CodHist: 20})
ON CREATE SET h20.Descricao = 'Funcionário ativo no setor de vendas.', h20.STATUS = 'Ativo', h20.Data_ini = date('2023-05-01')
WITH h20
MATCH (f20:Funcionario {CodFunc: 20})
MERGE (h20)-[:REGISTRADO_POR]->(f20);

MERGE (h21:Historico {CodHist: 21})
ON CREATE SET h21.Descricao = 'Funcionário ativo no setor de logística.', h21.STATUS = 'Ativo', h21.Data_ini = date('2022-08-01')
WITH h21
MATCH (f21:Funcionario {CodFunc: 21})
MERGE (h21)-[:REGISTRADO_POR]->(f21);

MERGE (h22:Historico {CodHist: 22})
ON CREATE SET h22.Descricao = 'Funcionário ativo no setor administrativo.', h22.STATUS = 'Ativo', h22.Data_ini = date('2023-04-01')
WITH h22
MATCH (f22:Funcionario {CodFunc: 22})
MERGE (h22)-[:REGISTRADO_POR]->(f22);

MERGE (h23:Historico {CodHist: 23})
ON CREATE SET h23.Descricao = 'Funcionário inativo após demissão.', h23.STATUS = 'Inativo', h23.Data_ini = date('2021-03-01'), h23.Data_fim = date('2021-03-01')
WITH h23
MATCH (f23:Funcionario {CodFunc: 23})
MERGE (h23)-[:REGISTRADO_POR]->(f23);

MERGE (h24:Historico {CodHist: 24})
ON CREATE SET h24.Descricao = 'Funcionário ativo no setor financeiro.', h24.STATUS = 'Ativo', h24.Data_ini = date('2023-02-01')
WITH h24
MATCH (f24:Funcionario {CodFunc: 24})
MERGE (h24)-[:REGISTRADO_POR]->(f24);

MERGE (h25:Historico {CodHist: 25})
ON CREATE SET h25.Descricao = 'Funcionário inativo por licença médica.', h25.STATUS = 'Inativo', h25.Data_ini = date('2024-05-01'), h25.Data_fim = date('2024-07-01')
WITH h25
MATCH (f25:Funcionario {CodFunc: 25})
MERGE (h25)-[:REGISTRADO_POR]->(f25);

MERGE (h26:Historico {CodHist: 26})
ON CREATE SET h26.Descricao = 'Funcionário ativo no setor de RH.', h26.STATUS = 'Ativo', h26.Data_ini = date('2023-07-01')
WITH h26
MATCH (f26:Funcionario {CodFunc: 26})
MERGE (h26)-[:REGISTRADO_POR]->(f26);

MERGE (h27:Historico {CodHist: 27})
ON CREATE SET h27.Descricao = 'Funcionário inativo após demissão.', h27.STATUS = 'Inativo', h27.Data_ini = date('2022-09-01'), h27.Data_fim = date('2022-09-01')
WITH h27
MATCH (f27:Funcionario {CodFunc: 27})
MERGE (h27)-[:REGISTRADO_POR]->(f27);

MERGE (h28:Historico {CodHist: 28})
ON CREATE SET h28.Descricao = 'Funcionário ativo no setor de projetos.', h28.STATUS = 'Ativo', h28.Data_ini = date('2023-08-01')
WITH h28
MATCH (f28:Funcionario {CodFunc: 28})
MERGE (h28)-[:REGISTRADO_POR]->(f28);

MERGE (h29:Historico {CodHist: 29})
ON CREATE SET h29.Descricao = 'Funcionário ativo no setor de suporte técnico.', h29.STATUS = 'Ativo', h29.Data_ini = date('2023-10-01')
WITH h29
MATCH (f29:Funcionario {CodFunc: 29})
MERGE (h29)-[:REGISTRADO_POR]->(f29);

MERGE (h30:Historico {CodHist: 30})
ON CREATE SET h30.Descricao = 'Funcionário inativo após término do contrato.', h30.STATUS = 'Inativo', h30.Data_ini = date('2024-01-01'), h30.Data_fim = date('2024-03-01')
WITH h30
MATCH (f30:Funcionario {CodFunc: 30})
MERGE (h30)-[:REGISTRADO_POR]->(f30);
