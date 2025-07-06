// Consulta 1: Listar todos os Funcionários e seus rótulos (tipo de funcionário)
// Retorna todos os nós com o rótulo 'Funcionario' e suas propriedades,
// incluindo quaisquer rótulos adicionais como 'Medico' ou 'Enfermeiro'.
MATCH (f:Funcionario)
RETURN f.CodFunc AS CodigoFuncionario, f.Nome AS NomeFuncionario, f.Vinculo AS Vinculo, labels(f) AS TiposDeFuncionario;

// Consulta 2: Encontrar todos os Médicos especializados em 'Cardiologia'
// Demonstra o uso de múltiplos rótulos e filtragem por propriedade.
MATCH (m:Medico)
WHERE m.Especializacao = 'Cardiologia'
RETURN m.Nome AS NomeMedico, m.CRM AS CRM, m.Especializacao AS Especializacao;

// Consulta 3: Encontrar todos os Pacientes nascidos após '1990-01-01'
// Utiliza a função date() para comparar datas.
MATCH (p:Paciente)
WHERE p.DataNasc > date('1990-01-01')
RETURN p.NomePac AS NomePaciente, p.DataNasc AS DataNascimento, p.CPF AS CPF
ORDER BY p.DataNasc ASC;

// Consulta 4: Encontrar o setor onde um funcionário específico (ex: João Silva - CodFunc: 1) trabalha e seu cargo
// Esta consulta junta nós de Funcionário e Setor através do relacionamento TRABALHA_EM,
// e retorna propriedades do relacionamento.
MATCH (f:Funcionario {CodFunc: 1})-[:TRABALHA_EM]->(s:Setor)
RETURN f.Nome AS NomeFuncionario, s.NomeSet AS NomeDoSetor, s.Local AS LocalDoSetor,
       head([(f)-[r:TRABALHA_EM]->(s) | r.Cargo]) AS CargoDoFuncionario; // Usa head para pegar o cargo do relacionamento

// Consulta 5: Listar todos os Remédios que são Controlados
// Uma consulta direta para filtrar por uma propriedade booleana.
MATCH (r:Remedio)
WHERE r.Controlado = true
RETURN r.NomeRem AS NomeRemedio, r.Tipo AS TipoRemedio, r.Controlado AS EhControlado;

// Consulta 6: Encontrar todos os Médicos que realizaram uma consulta em um mês específico (ex: Janeiro de 2025)
// e os Pacientes que eles atenderam nessas consultas.
// Esta consulta envolve múltiplos saltos (Médico -> Consulta -> Paciente) e filtragem por data.
MATCH (m:Medico)-[:REALIZA]->(co:Consulta)<-[:EH_PACIENTE_DA_CONSULTA]-(p:Paciente)
WHERE co.Dia.year = 2025 AND co.Dia.month = 1
RETURN m.Nome AS NomeMedico, p.NomePac AS NomePaciente, co.Dia AS DataConsulta, co.Hora AS HoraConsulta
ORDER BY NomeMedico, DataConsulta, HoraConsulta;

// Consulta 7: Encontrar a quantidade total em estoque de um remédio específico (ex: Paracetamol - CodRem: 1)
// mostrando os detalhes de cada unidade (lote, data de vencimento) e a quantidade em estoque dessa unidade.
// Envolve múltiplos relacionamentos e agregação.
MATCH (r:Remedio {CodRem: 1})<-[e:TEM_ESTOQUE_DA_UNIDADE]-(ru:RemedioUnidade)
RETURN r.NomeRem AS NomeRemedio, ru.CodUnid AS CodigoUnidade, ru.Lote AS Lote,
       ru.DataVenc AS DataVencimentoUnidade, e.Quantidade AS QuantidadeEmEstoque
ORDER BY ru.DataVenc ASC;

// Consulta 8: Encontrar todos os Funcionários que estão 'Ativo' e seus históricos de status.
// Retorna funcionários e seus históricos, filtrando o status do histórico.
MATCH (f:Funcionario)<-[r:REGISTRADO_POR]-(h:Historico)
WHERE h.STATUS = 'Ativo'
RETURN f.Nome AS NomeFuncionario, h.Descricao AS DescricaoHistorico, h.STATUS AS StatusHistorico,
       h.Data_ini AS DataInicioHistorico, h.Data_fim AS DataFimHistorico
ORDER BY f.Nome, h.Data_ini DESC;

// Consulta 9: Encontrar todas as consultas de um paciente específico (ex: Amanda Silva - CodPac: 1)
// incluindo o médico que realizou a consulta, o consultório e qualquer remédio utilizado.
// Uma consulta complexa que atravessa vários relacionamentos e lida com dados opcionais (remedios).
MATCH (p:Paciente {CodPac: 1})-[:EH_PACIENTE_DA_CONSULTA]->(co:Consulta)
MATCH (co)<-[:REALIZA]-(f:Funcionario)
MATCH (co)-[:OCORRE_EM]->(c:Consultorio)
OPTIONAL MATCH (ru:RemedioUnidade)-[:EH_UTILIZADO_EM]->(co)
OPTIONAL MATCH (ru)-[:EH_UNIDADE_DE]->(rem:Remedio) // Para pegar o nome do remédio
RETURN p.NomePac AS NomePaciente, co.Dia AS DataConsulta, co.Hora AS HoraConsulta,
       f.Nome AS NomeMedico, f.Especializacao AS EspecializacaoMedico,
       c.Sala AS SalaConsultorio, c.Descricao AS DescricaoConsultorio,
       COLLECT(DISTINCT rem.NomeRem) AS RemediosUtilizados
ORDER BY co.Dia, co.Hora;


// Consulta 10: Encontrar todos os consultórios supervisionados por um médico específico (ex: Fernanda Almeida - CodFunc: 11)
// e listar todas as consultas que ocorreram nesses consultórios.
// Envolve múltiplos saltos e coleta de informações.
MATCH (f:Medico {CodFunc: 11})-[:SUPERVISIONADO_POR]->(c:Consultorio)
MATCH (c)<-[:OCORRE_EM]-(co:Consulta)
MATCH (co)<-[:REALIZA]-(medicoConsulta:Funcionario) // O médico que REALIZOU a consulta
MATCH (co)-[:EH_PACIENTE_DA_CONSULTA]->(pac:Paciente) // O paciente da consulta
RETURN f.Nome AS MedicoSupervisor, c.Sala AS ConsultorioSupervisionado,
       co.Dia AS DataConsulta, co.Hora AS HoraConsulta,
       medicoConsulta.Nome AS MedicoDaConsulta, pac.NomePac AS PacienteDaConsulta
ORDER BY c.Sala, co.Dia, co.Hora;

// Consulta 11: Listar Pacientes que tiveram consultas onde um Remédio Controlado de um tipo específico
// (ex: 'Ansiolítico') foi utilizado, e identificar os Médicos envolvidos nessas consultas.
// Esta consulta exige múltiplos saltos e filtragem em propriedades de nós e relacionamentos.
MATCH (p:Paciente)-[:EH_PACIENTE_DA_CONSULTA]->(co:Consulta)
MATCH (co)<-[:REALIZA]-(m:Medico)
MATCH (ru:RemedioUnidade)-[:EH_UTILIZADO_EM]->(co)
MATCH (ru)-[:EH_UNIDADE_DE]->(rem:Remedio)
WHERE rem.Controlado = true AND rem.Tipo = 'Ansiolítico'
RETURN p.NomePac AS NomePaciente, p.CPF AS CPFPaciente,
       m.Nome AS NomeMedicoResponsavel, m.CRM AS CRMMedico, m.Especializacao AS EspecializacaoMedico,
       co.Dia AS DataConsulta, co.Hora AS HoraConsulta,
       rem.NomeRem AS RemedioUtilizado, rem.Tipo AS TipoRemedio, rem.Controlado AS RemedioControlado
ORDER BY p.NomePac, co.Dia, co.Hora;

// Consulta 12: Contar o número de consultas realizadas por cada Médico por mês.
// Esta consulta demonstra o uso de extração de partes de data e agregação (COUNT)
// para obter uma visão mensal da atividade dos médicos.
MATCH (m:Medico)-[:REALIZA]->(co:Consulta)
RETURN m.Nome AS NomeMedico,
       co.Dia.year AS AnoDaConsulta,
       co.Dia.month AS MesDaConsulta,
       COUNT(co) AS TotalConsultasNoMes
ORDER BY NomeMedico, AnoDaConsulta DESC, MesDaConsulta DESC;

// Consulta 13: Encontrar os Setores com a maior diversidade de Cargos Administrativos.
// Esta consulta utiliza COLLECT e SIZE para contar a quantidade de cargos únicos
MATCH (s:Setor)<-[r:TRABALHA_EM]-(f:Funcionario)
WHERE r.Cargo IS NOT NULL // Garante que o relacionamento TRABALHA_EM tenha a propriedade Cargo
WITH s.NomeSet AS NomeDoSetor, COLLECT(DISTINCT r.Cargo) AS CargosUnicosNoSetor
WHERE SIZE(CargosUnicosNoSetor) >= 1 // Filtra para setores com um ou mais de um cargo distinto
RETURN NomeDoSetor, CargosUnicosNoSetor, SIZE(CargosUnicosNoSetor) AS QuantidadeDeCargosDistintos
ORDER BY QuantidadeDeCargosDistintos DESC, NomeDoSetor ASC;


