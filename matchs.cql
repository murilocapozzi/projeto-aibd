// Relacionamento: Setor é GERENCIADO_POR um Funcionário
// SQL: Setor.CodFunc referencia Funcionario.CodFunc
MATCH (s:Setor {CodSet: 1}), (f:Funcionario {CodFunc: 101})
CREATE (s)-[:GERENCIADO_POR]->(f);

// Relacionamento: Funcionário TRABALHA_EM um Setor (da tabela Administrativo)
// SQL: Administrativo(CodFunc, CodSet, Cargo)
MATCH (f:Funcionario {CodFunc: 101}), (s:Setor {CodSet: 1})
CREATE (f)-[:TRABALHA_EM {Cargo: 'Coordenador'}]->(s);

// Relacionamento: Histórico é REGISTRADO_POR um Funcionário
// SQL: Historico.CodFunc referencia Funcionario.CodFunc
MATCH (h:Historico {CodHist: 1001}), (f:Funcionario {CodFunc: 201})
CREATE (h)-[:REGISTRADO_POR]->(f);

// Relacionamento: Consultório é SUPERVISIONADO_POR um Funcionário
// SQL: Consultorio.CodFunc referencia Funcionario.CodFunc
MATCH (c:Consultorio {CodConsult: 501}), (f:Funcionario {CodFunc: 201})
CREATE (c)-[:SUPERVISIONADO_POR]->(f);

// Relacionamento: Funcionário ATUA_EM um Consultório (da tabela ConsultCli)
// SQL: ConsultCli(CodConsult, CodFunc)
MATCH (f:Funcionario {CodFunc: 301}), (c:Consultorio {CodConsult: 501})
CREATE (f)-[:ATUA_EM]->(c);

// Relacionamento: RemedioUnidade é uma UNIDADE_DE um Remédio
// SQL: RemedioUnidade.CodRem referencia Remedios.CodRem
MATCH (ru:RemedioUnidade {CodUnid: 100}), (r:Remedio {CodRem: 1})
CREATE (ru)-[:EH_UNIDADE_DE]->(r);

// Relacionamento: Remédio tem ESTOQUE_DA_UNIDADE com propriedades (da tabela Estoque)
// Esta relação liga a unidade de remédio ao remédio geral com informações de estoque.
// SQL: Estoque(CodUnid, CodRem, DataCompra, Quantidade)
MATCH (ru:RemedioUnidade {CodUnid: 100}), (r:Remedio {CodRem: 1})
CREATE (ru)-[:TEM_ESTOQUE_DA_UNIDADE {
    DataCompra: date('2024-05-01'),
    Quantidade: 50
}]->(r);

// Relacionamentos para o Nó de Consulta (a tabela Consulta é um hub de relações)
// SQL: Consulta(CodFunc, CodUnid, Dia, Hora, CodConsult, CodPac)

// Funcionário REALIZA uma Consulta
MATCH (f:Funcionario {CodFunc: 201}), (co:Consulta {Dia: date('2024-06-17'), Hora: time('14:30:00')})
CREATE (f)-[:REALIZA]->(co);

// Paciente É_PACIENTE_DA_CONSULTA
MATCH (p:Paciente {CodPac: 10001}), (co:Consulta {Dia: date('2024-06-17'), Hora: time('14:30:00')})
CREATE (p)-[:EH_PACIENTE_DA_CONSULTA]->(co);

// Consulta OCORRE_EM um Consultório
MATCH (co:Consulta {Dia: date('2024-06-17'), Hora: time('14:30:00')}), (c:Consultorio {CodConsult: 501})
CREATE (co)-[:OCORRE_EM]->(c);

// RemédioUnidade É_UTILIZADO_EM uma Consulta
MATCH (ru:RemedioUnidade {CodUnid: 100}), (co:Consulta {Dia: date('2024-06-17'), Hora: time('14:30:00')})
CREATE (ru)-[:EH_UTILIZADO_EM]->(co);
