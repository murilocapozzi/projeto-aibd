// Inserção de dados para a entidade Medico
// Adiciona o rótulo :Medico e as propriedades CRM e Especializacao
// aos nós Funcionario existentes com o CodFunc correspondente.

MERGE (f11:Funcionario {CodFunc: 11})
ON MATCH SET f11:Medico, f11.CRM = '123456-SP', f11.Especializacao = 'Cardiologia'
ON CREATE SET f11.Nome = 'Fernanda Almeida', f11.Vinculo = 'CLT', f11:Medico, f11.CRM = '123456-SP', f11.Especializacao = 'Cardiologia';

MERGE (f12:Funcionario {CodFunc: 12})
ON MATCH SET f12:Medico, f12.CRM = '789012-SP', f12.Especializacao = 'Pediatria'
ON CREATE SET f12.Nome = 'Carlos Mendes', f12.Vinculo = 'CNPJ', f12:Medico, f12.CRM = '789012-SP', f12.Especializacao = 'Pediatria';

MERGE (f13:Funcionario {CodFunc: 13})
ON MATCH SET f13:Medico, f13.CRM = '345678-RJ', f13.Especializacao = 'Ortopedia'
ON CREATE SET f13.Nome = 'Roberto Farias', f13.Vinculo = 'CLT', f13:Medico, f13.CRM = '345678-RJ', f13.Especializacao = 'Ortopedia';

MERGE (f14:Funcionario {CodFunc: 14})
ON MATCH SET f14:Medico, f14.CRM = '567890-MG', f14.Especializacao = 'Dermatologia'
ON CREATE SET f14.Nome = 'Aline Castro', f14.Vinculo = 'CNPJ', f14:Medico, f14.CRM = '567890-MG', f14.Especializacao = 'Dermatologia';

MERGE (f15:Funcionario {CodFunc: 15})
ON MATCH SET f15:Medico, f15.CRM = '234567-SP', f15.Especializacao = 'Gastroenterologia'
ON CREATE SET f15.Nome = 'Gustavo Lima', f15.Vinculo = 'CLT', f15:Medico, f15.CRM = '234567-SP', f15.Especializacao = 'Gastroenterologia';

MERGE (f16:Funcionario {CodFunc: 16})
ON MATCH SET f16:Medico, f16.CRM = '890123-RJ', f16.Especializacao = 'Neurologia'
ON CREATE SET f16.Nome = 'Patrícia Fonseca', f16.Vinculo = 'CNPJ', f16:Medico, f16.CRM = '890123-RJ', f16.Especializacao = 'Neurologia';

MERGE (f17:Funcionario {CodFunc: 17})
ON MATCH SET f17:Medico, f17.CRM = '456789-MG', f17.Especializacao = 'Psiquiatria'
ON CREATE SET f17.Nome = 'Lucas Silva', f17.Vinculo = 'CLT', f17:Medico, f17.CRM = '456789-MG', f17.Especializacao = 'Psiquiatria';

MERGE (f18:Funcionario {CodFunc: 18})
ON MATCH SET f18:Medico, f18.CRM = '678901-PR', f18.Especializacao = 'Oftalmologia'
ON CREATE SET f18.Nome = 'Ana Paula Santos', f18.Vinculo = 'CNPJ', f18:Medico, f18.CRM = '678901-PR', f18.Especializacao = 'Oftalmologia';

MERGE (f19:Funcionario {CodFunc: 19})
ON MATCH SET f19:Medico, f19.CRM = '345123-SP', f19.Especializacao = 'Ginecologia'
ON CREATE SET f19.Nome = 'Fábio Ribeiro', f19.Vinculo = 'CLT', f19:Medico, f19.CRM = '345123-SP', f19.Especializacao = 'Ginecologia';

MERGE (f20:Funcionario {CodFunc: 20})
ON MATCH SET f20:Medico, f20.CRM = '901234-RS', f20.Especializacao = 'Anestesiologia'
ON CREATE SET f20.Nome = 'Camila Teixeira', f20.Vinculo = 'CNPJ', f20:Medico, f20.CRM = '901234-RS', f20.Especializacao = 'Anestesiologia';
