// Restrição de unicidade para o Código do Funcionário
CREATE CONSTRAINT ON (f:Funcionario) ASSERT f.CodFunc IS UNIQUE;

// Restrição de unicidade para o Código do Setor
CREATE CONSTRAINT ON (s:Setor) ASSERT s.CodSet IS UNIQUE;

// Restrição de unicidade para o Código do Histórico
CREATE CONSTRAINT ON (h:Historico) ASSERT h.CodHist IS UNIQUE;

// Restrição de unicidade para o Código do Consultório
CREATE CONSTRAINT ON (c:Consultorio) ASSERT c.CodConsult IS UNIQUE;

// Restrição de unicidade para o Código do Paciente
CREATE CONSTRAINT ON (p:Paciente) ASSERT p.CodPac IS UNIQUE;
// Restrição de unicidade para o CPF do Paciente
CREATE CONSTRAINT ON (p:Paciente) ASSERT p.CPF IS UNIQUE;

// Restrição de unicidade para o Código do Remédio
CREATE CONSTRAINT ON (r:Remedio) ASSERT r.CodRem IS UNIQUE;

// Restrição de unicidade para o Código da Unidade de Remédio
CREATE CONSTRAINT ON (ru:RemedioUnidade) ASSERT ru.CodUnid IS UNIQUE;