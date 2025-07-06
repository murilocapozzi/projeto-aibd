// Relacionamento: Setor é GERENCIADO_POR um Funcionário
MATCH (s:Setor {CodSet: 1})
MATCH (f:Funcionario {CodFunc: 101})
CREATE (s)-[:GERENCIADO_POR]->(f);

// Relacionamento: Funcionário TRABALHA_EM um Setor (da tabela Administrativo)
MATCH (f:Funcionario {CodFunc: 101})
MATCH (s:Setor {CodSet: 1})
CREATE (f)-[:TRABALHA_EM {Cargo: 'Coordenador'}]->(s);

// Relacionamento: Histórico é REGISTRADO_POR um Funcionário
MATCH (h:Historico {CodHist: 1001})
MATCH (f:Funcionario {CodFunc: 201})
CREATE (h)-[:REGISTRADO_POR]->(f);

// Relacionamento: Consultório é SUPERVISIONADO_POR um Funcionário
MATCH (c:Consultorio {CodConsult: 501})
MATCH (f:Funcionario {CodFunc: 201})
CREATE (c)-[:SUPERVISIONADO_POR]->(f);

// Relacionamento: Funcionário ATUA_EM um Consultório (da tabela ConsultCli)
MATCH (f:Funcionario {CodFunc: 301})
MATCH (c:Consultorio {CodConsult: 501})
CREATE (f)-[:ATUA_EM]->(c);

// Relacionamento: RemedioUnidade é uma UNIDADE_DE um Remédio
MATCH (ru:RemedioUnidade {CodUnid: 100})
MATCH (r:Remedio {CodRem: 1})
CREATE (ru)-[:EH_UNIDADE_DE]->(r);

// Relacionamento: Remédio tem ESTOQUE_DA_UNIDADE com propriedades
MATCH (ru:RemedioUnidade {CodUnid: 100})
MATCH (r:Remedio {CodRem: 1})
CREATE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {
    DataCompra: date('2024-05-01'),
    Quantidade: 50
}]->(r);

// Funcionário REALIZA uma Consulta
MATCH (f:Funcionario {CodFunc: 201})
MATCH (co:Consulta {Dia: date('2024-06-17'), Hora: time('14:30:00')})
CREATE (f)-[:REALIZA]->(co);

// Paciente É_PACIENTE_DA_CONSULTA
MATCH (p:Paciente {CodPac: 10001})
MATCH (co:Consulta {Dia: date('2024-06-17'), Hora: time('14:30:00')})
CREATE (p)-[:EH_PACIENTE_DA_CONSULTA]->(co);

// Consulta OCORRE_EM um Consultório
MATCH (co:Consulta {Dia: date('2024-06-17'), Hora: time('14:30:00')})
MATCH (c:Consultorio {CodConsult: 501})
CREATE (co)-[:OCORRE_EM]->(c);

// RemédioUnidade É_UTILIZADO_EM uma Consulta
MATCH (ru:RemedioUnidade {CodUnid: 100})
MATCH (co:Consulta {Dia: date('2024-06-17'), Hora: time('14:30:00')})
CREATE (ru)-[:EH_UTILIZADO_EM]->(co);
