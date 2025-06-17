// Inserção de dados para a tabela Consulta, que se traduz na criação de nós de Consulta e múltiplos relacionamentos.
// Cada nó de Consulta representa um evento único de consulta.

MATCH (f11:Funcionario {CodFunc: 11}),
      (ru1:RemedioUnidade {CodUnid: 1}),
      (c1:Consultorio {CodConsult: 1}),
      (p1:Paciente {CodPac: 1})
MERGE (co1:Consulta {ConsultaId: 1, Dia: date('2025-01-15'), Hora: time('09:00:00')})
MERGE (f11)-[:REALIZA]->(co1)
MERGE (co1)-[:OCORRE_EM]->(c1)
MERGE (ru1)-[:EH_UTILIZADO_EM]->(co1)
MERGE (p1)-[:EH_PACIENTE_DA_CONSULTA]->(co1);

MATCH (f12:Funcionario {CodFunc: 12}),
      (ru2:RemedioUnidade {CodUnid: 2}),
      (c2:Consultorio {CodConsult: 2}),
      (p2:Paciente {CodPac: 2})
MERGE (co2:Consulta {ConsultaId: 2, Dia: date('2025-01-16'), Hora: time('10:30:00')})
MERGE (f12)-[:REALIZA]->(co2)
MERGE (co2)-[:OCORRE_EM]->(c2)
MERGE (ru2)-[:EH_UTILIZADO_EM]->(co2)
MERGE (p2)-[:EH_PACIENTE_DA_CONSULTA]->(co2);

MATCH (f13:Funcionario {CodFunc: 13}),
      (ru3:RemedioUnidade {CodUnid: 3}),
      (c3:Consultorio {CodConsult: 3}),
      (p3:Paciente {CodPac: 3})
MERGE (co3:Consulta {ConsultaId: 3, Dia: date('2025-01-17'), Hora: time('11:15:00')})
MERGE (f13)-[:REALIZA]->(co3)
MERGE (co3)-[:OCORRE_EM]->(c3)
MERGE (ru3)-[:EH_UTILIZADO_EM]->(co3)
MERGE (p3)-[:EH_PACIENTE_DA_CONSULTA]->(co3);

MATCH (f14:Funcionario {CodFunc: 14}),
      (ru4:RemedioUnidade {CodUnid: 4}),
      (c4:Consultorio {CodConsult: 4}),
      (p4:Paciente {CodPac: 4})
MERGE (co4:Consulta {ConsultaId: 4, Dia: date('2025-01-18'), Hora: time('08:45:00')})
MERGE (f14)-[:REALIZA]->(co4)
MERGE (co4)-[:OCORRE_EM]->(c4)
MERGE (ru4)-[:EH_UTILIZADO_EM]->(co4)
MERGE (p4)-[:EH_PACIENTE_DA_CONSULTA]->(co4);

MATCH (f15:Funcionario {CodFunc: 15}),
      (ru5:RemedioUnidade {CodUnid: 5}),
      (c5:Consultorio {CodConsult: 5}),
      (p5:Paciente {CodPac: 5})
MERGE (co5:Consulta {ConsultaId: 5, Dia: date('2025-01-19'), Hora: time('14:00:00')})
MERGE (f15)-[:REALIZA]->(co5)
MERGE (co5)-[:OCORRE_EM]->(c5)
MERGE (ru5)-[:EH_UTILIZADO_EM]->(co5)
MERGE (p5)-[:EH_PACIENTE_DA_CONSULTA]->(co5);

MATCH (f16:Funcionario {CodFunc: 16}),
      (ru6:RemedioUnidade {CodUnid: 6}),
      (c6:Consultorio {CodConsult: 6}),
      (p6:Paciente {CodPac: 6})
MERGE (co6:Consulta {ConsultaId: 6, Dia: date('2025-01-20'), Hora: time('13:30:00')})
MERGE (f16)-[:REALIZA]->(co6)
MERGE (co6)-[:OCORRE_EM]->(c6)
MERGE (ru6)-[:EH_UTILIZADO_EM]->(co6)
MERGE (p6)-[:EH_PACIENTE_DA_CONSULTA]->(co6);

MATCH (f17:Funcionario {CodFunc: 17}),
      (ru7:RemedioUnidade {CodUnid: 7}),
      (c7:Consultorio {CodConsult: 7}),
      (p7:Paciente {CodPac: 7})
MERGE (co7:Consulta {ConsultaId: 7, Dia: date('2025-01-21'), Hora: time('15:00:00')})
MERGE (f17)-[:REALIZA]->(co7)
MERGE (co7)-[:OCORRE_EM]->(c7)
MERGE (ru7)-[:EH_UTILIZADO_EM]->(co7)
MERGE (p7)-[:EH_PACIENTE_DA_CONSULTA]->(co7);

MATCH (f18:Funcionario {CodFunc: 18}),
      (ru8:RemedioUnidade {CodUnid: 8}),
      (c8:Consultorio {CodConsult: 8}),
      (p8:Paciente {CodPac: 8})
MERGE (co8:Consulta {ConsultaId: 8, Dia: date('2025-01-22'), Hora: time('09:30:00')})
MERGE (f18)-[:REALIZA]->(co8)
MERGE (co8)-[:OCORRE_EM]->(c8)
MERGE (ru8)-[:EH_UTILIZADO_EM]->(co8)
MERGE (p8)-[:EH_PACIENTE_DA_CONSULTA]->(co8);

MATCH (f19:Funcionario {CodFunc: 19}),
      (ru9:RemedioUnidade {CodUnid: 9}),
      (c9:Consultorio {CodConsult: 9}),
      (p9:Paciente {CodPac: 9})
MERGE (co9:Consulta {ConsultaId: 9, Dia: date('2025-01-23'), Hora: time('10:00:00')})
MERGE (f19)-[:REALIZA]->(co9)
MERGE (co9)-[:OCORRE_EM]->(c9)
MERGE (ru9)-[:EH_UTILIZADO_EM]->(co9)
MERGE (p9)-[:EH_PACIENTE_DA_CONSULTA]->(co9);

MATCH (f20:Funcionario {CodFunc: 20}),
      (ru10:RemedioUnidade {CodUnid: 10}),
      (c10:Consultorio {CodConsult: 10}),
      (p10:Paciente {CodPac: 10})
MERGE (co10:Consulta {ConsultaId: 10, Dia: date('2025-01-24'), Hora: time('11:45:00')})
MERGE (f20)-[:REALIZA]->(co10)
MERGE (co10)-[:OCORRE_EM]->(c10)
MERGE (ru10)-[:EH_UTILIZADO_EM]->(co10)
MERGE (p10)-[:EH_PACIENTE_DA_CONSULTA]->(co10);