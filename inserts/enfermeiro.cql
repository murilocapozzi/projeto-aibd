// Inserção de dados para a entidade Enfermeiro
// Adiciona o rótulo :Enfermeiro e a propriedade COREN
// aos nós Funcionario existentes com o CodFunc correspondente.

MERGE (f21:Funcionario {CodFunc: 21})
ON MATCH SET f21:Enfermeiro, f21.COREN = 'COREN-12345-SP'
ON CREATE SET f21.Nome = 'Rafael Moreira', f21.Vinculo = 'CLT', f21:Enfermeiro, f21.COREN = 'COREN-12345-SP';

MERGE (f22:Funcionario {CodFunc: 22})
ON MATCH SET f22:Enfermeiro, f22.COREN = 'COREN-67890-SP'
ON CREATE SET f22.Nome = 'Juliana Alves', f22.Vinculo = 'CLT', f22:Enfermeiro, f22.COREN = 'COREN-67890-SP';

MERGE (f23:Funcionario {CodFunc: 23})
ON MATCH SET f23:Enfermeiro, f23.COREN = 'COREN-23456-MG'
ON CREATE SET f23.Nome = 'Marcos Vinícius', f23.Vinculo = 'CNPJ', f23:Enfermeiro, f23.COREN = 'COREN-23456-MG';

MERGE (f24:Funcionario {CodFunc: 24})
ON MATCH SET f24:Enfermeiro, f24.COREN = 'COREN-78901-RJ'
ON CREATE SET f24.Nome = 'Cláudia Rocha', f24.Vinculo = 'CLT', f24:Enfermeiro, f24.COREN = 'COREN-78901-RJ';

MERGE (f25:Funcionario {CodFunc: 25})
ON MATCH SET f25:Enfermeiro, f25.COREN = 'COREN-34567-PR'
ON CREATE SET f25.Nome = 'Eduardo Matos', f25.Vinculo = 'CNPJ', f25:Enfermeiro, f25.COREN = 'COREN-34567-PR';

MERGE (f26:Funcionario {CodFunc: 26})
ON MATCH SET f26:Enfermeiro, f26.COREN = 'COREN-89012-BA'
ON CREATE SET f26.Nome = 'Renata Oliveira', f26.Vinculo = 'CLT', f26:Enfermeiro, f26.COREN = 'COREN-89012-BA';

MERGE (f27:Funcionario {CodFunc: 27})
ON MATCH SET f27:Enfermeiro, f27.COREN = 'COREN-45678-RS'
ON CREATE SET f27.Nome = 'Thiago Ferreira', f27.Vinculo = 'CNPJ', f27:Enfermeiro, f27.COREN = 'COREN-45678-RS';

MERGE (f28:Funcionario {CodFunc: 28})
ON MATCH SET f28:Enfermeiro, f28.COREN = 'COREN-90123-SC'
ON CREATE SET f28.Nome = 'Letícia Ramos', f28.Vinculo = 'CLT', f28:Enfermeiro, f28.COREN = 'COREN-90123-SC';

MERGE (f29:Funcionario {CodFunc: 29})
ON MATCH SET f29:Enfermeiro, f29.COREN = 'COREN-56789-PE'
ON CREATE SET f29.Nome = 'Bruno Costa', f29.Vinculo = 'CLT', f29:Enfermeiro, f29.COREN = 'COREN-56789-PE';

MERGE (f30:Funcionario {CodFunc: 30})
ON MATCH SET f30:Enfermeiro, f30.COREN = 'COREN-01234-AL'
ON CREATE SET f30.Nome = 'Viviane Santos', f30.Vinculo = 'CNPJ', f30:Enfermeiro, f30.COREN = 'COREN-01234-AL';
