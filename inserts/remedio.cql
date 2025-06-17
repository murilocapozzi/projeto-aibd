// Inserção de dados para a entidade Remedio
// Usamos MERGE para criar o nó se ele não existir,
// e para corresponder a ele se já existir (evitando duplicações baseadas em CodRem).
// Note que SQL FALSE/0 e TRUE/1 são mapeados para Cypher false e true.

MERGE (r1:Remedio {CodRem: 1})
ON CREATE SET r1.NomeRem = 'Paracetamol', r1.Tipo = 'Analgésico', r1.Descricao = 'Utilizado para alívio de dores e febres.', r1.Controlado = false;

MERGE (r2:Remedio {CodRem: 2})
ON CREATE SET r2.NomeRem = 'Ibuprofeno', r2.Tipo = 'Anti-inflamatório', r2.Descricao = 'Usado no tratamento de inflamações e dores.', r2.Controlado = false;

MERGE (r3:Remedio {CodRem: 3})
ON CREATE SET r3.NomeRem = 'Amoxicilina', r3.Tipo = 'Antibiótico', r3.Descricao = 'Antibiótico de amplo espectro para infecções.', r3.Controlado = true;

MERGE (r4:Remedio {CodRem: 4})
ON CREATE SET r4.NomeRem = 'Diazepam', r4.Tipo = 'Ansiolítico', r4.Descricao = 'Utilizado no tratamento de ansiedade.', r4.Controlado = true;

MERGE (r5:Remedio {CodRem: 5})
ON CREATE SET r5.NomeRem = 'Omeprazol', r5.Tipo = 'Antiácido', r5.Descricao = 'Usado no tratamento de gastrite e refluxo.', r5.Controlado = false;

MERGE (r6:Remedio {CodRem: 6})
ON CREATE SET r6.NomeRem = 'Metformina', r6.Tipo = 'Antidiabético', r6.Descricao = 'Tratamento de diabetes tipo 2.', r6.Controlado = false;

MERGE (r7:Remedio {CodRem: 7})
ON CREATE SET r7.NomeRem = 'Losartana', r7.Tipo = 'Antihipertensivo', r7.Descricao = 'Indicado para controle da pressão arterial.', r7.Controlado = false;

MERGE (r8:Remedio {CodRem: 8})
ON CREATE SET r8.NomeRem = 'Cetirizina', r8.Tipo = 'Antialérgico', r8.Descricao = 'Usado no tratamento de alergias.', r8.Controlado = false;

MERGE (r9:Remedio {CodRem: 9})
ON CREATE SET r9.NomeRem = 'Rivotril', r9.Tipo = 'Ansiolítico', r9.Descricao = 'Usado no tratamento de ansiedade e epilepsia.', r9.Controlado = true;

MERGE (r10:Remedio {CodRem: 10})
ON CREATE SET r10.NomeRem = 'Prednisona', r10.Tipo = 'Corticosteroide', r10.Descricao = 'Indicada para tratamento de inflamações graves.', r10.Controlado = true;

MERGE (r11:Remedio {CodRem: 11})
ON CREATE SET r11.NomeRem = 'Aspirina', r11.Tipo = 'Analgésico', r11.Descricao = 'Usado para aliviar dores leves e febres.', r11.Controlado = false;

MERGE (r12:Remedio {CodRem: 12})
ON CREATE SET r12.NomeRem = 'Cloroquina', r12.Tipo = 'Antimalárico', r12.Descricao = 'Tratamento de malária e doenças autoimunes.', r12.Controlado = true;

MERGE (r13:Remedio {CodRem: 13})
ON CREATE SET r13.NomeRem = 'Loratadina', r13.Tipo = 'Antialérgico', r13.Descricao = 'Usado no tratamento de alergias e rinite.', r13.Controlado = false;

MERGE (r14:Remedio {CodRem: 14})
ON CREATE SET r14.NomeRem = 'Fluoxetina', r14.Tipo = 'Antidepressivo', r14.Descricao = 'Utilizado no tratamento de depressão e ansiedade.', r14.Controlado = true;

MERGE (r15:Remedio {CodRem: 15})
ON CREATE SET r15.NomeRem = 'Carbamazepina', r15.Tipo = 'Anticonvulsivante', r15.Descricao = 'Indicado para o tratamento de epilepsia.', r15.Controlado = true;
