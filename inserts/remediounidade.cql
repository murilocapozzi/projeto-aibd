// Inserção de dados para a entidade RemedioUnidade e criação do relacionamento EH_UNIDADE_DE
// Usamos MERGE para o nó RemedioUnidade para criar se não existir e corresponder se existir.
// Usamos MATCH para encontrar o Remédio correspondente e então criar o relacionamento.

MERGE (ru1:RemedioUnidade {CodUnid: 1})
ON CREATE SET ru1.Lote = 'L12345', ru1.DataVenc = date('2025-12-31'), ru1.Laboratorio = 'Laboratório ABC'
WITH ru1
MATCH (r1:Remedio {CodRem: 1})
MERGE (ru1)-[:EH_UNIDADE_DE]->(r1);

MERGE (ru2:RemedioUnidade {CodUnid: 2})
ON CREATE SET ru2.Lote = 'L23456', ru2.DataVenc = date('2024-06-15'), ru2.Laboratorio = 'Laboratório XYZ'
WITH ru2
MATCH (r2:Remedio {CodRem: 2})
MERGE (ru2)-[:EH_UNIDADE_DE]->(r2);

MERGE (ru3:RemedioUnidade {CodUnid: 3})
ON CREATE SET ru3.Lote = 'L34567', ru3.DataVenc = date('2025-08-20'), ru3.Laboratorio = 'Farmacêutica Nacional'
WITH ru3
MATCH (r3:Remedio {CodRem: 3})
MERGE (ru3)-[:EH_UNIDADE_DE]->(r3);

MERGE (ru4:RemedioUnidade {CodUnid: 4})
ON CREATE SET ru4.Lote = 'L45678', ru4.DataVenc = date('2026-03-10'), ru4.Laboratorio = 'Laboratório Silva'
WITH ru4
MATCH (r4:Remedio {CodRem: 4})
MERGE (ru4)-[:EH_UNIDADE_DE]->(r4);

MERGE (ru5:RemedioUnidade {CodUnid: 5})
ON CREATE SET ru5.Lote = 'L56789', ru5.DataVenc = date('2024-12-01'), ru5.Laboratorio = 'Química Moderna'
WITH ru5
MATCH (r5:Remedio {CodRem: 5})
MERGE (ru5)-[:EH_UNIDADE_DE]->(r5);

MERGE (ru6:RemedioUnidade {CodUnid: 6})
ON CREATE SET ru6.Lote = 'L67890', ru6.DataVenc = date('2025-11-25'), ru6.Laboratorio = 'Indústria Farma'
WITH ru6
MATCH (r6:Remedio {CodRem: 6})
MERGE (ru6)-[:EH_UNIDADE_DE]->(r6);

MERGE (ru7:RemedioUnidade {CodUnid: 7})
ON CREATE SET ru7.Lote = 'L78901', ru7.DataVenc = date('2026-07-30'), ru7.Laboratorio = 'LabVida'
WITH ru7
MATCH (r7:Remedio {CodRem: 7})
MERGE (ru7)-[:EH_UNIDADE_DE]->(r7);

MERGE (ru8:RemedioUnidade {CodUnid: 8})
ON CREATE SET ru8.Lote = 'L89012', ru8.DataVenc = date('2025-05-18'), ru8.Laboratorio = 'Saúde e Vida'
WITH ru8
MATCH (r8:Remedio {CodRem: 8})
MERGE (ru8)-[:EH_UNIDADE_DE]->(r8);

MERGE (ru9:RemedioUnidade {CodUnid: 9})
ON CREATE SET ru9.Lote = 'L90123', ru9.DataVenc = date('2024-09-14'), ru9.Laboratorio = 'Laboratório Santos'
WITH ru9
MATCH (r9:Remedio {CodRem: 9})
MERGE (ru9)-[:EH_UNIDADE_DE]->(r9);

MERGE (ru10:RemedioUnidade {CodUnid: 10})
ON CREATE SET ru10.Lote = 'L01234', ru10.DataVenc = date('2026-01-08'), ru10.Laboratorio = 'BioMedic'
WITH ru10
MATCH (r10:Remedio {CodRem: 10})
MERGE (ru10)-[:EH_UNIDADE_DE]->(r10);
