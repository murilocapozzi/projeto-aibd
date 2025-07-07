// Inserção de dados para a entidade Paciente
// Usamos MERGE para criar o nó se ele não existir,
// e para corresponder a ele se já existir (evitando duplicações baseadas em CodPac).

MERGE (p1:Paciente {CodPac: 1})
ON CREATE SET p1.NomePac = 'Amanda Silva', p1.CPF = '123.456.789-01', p1.DataNasc = date('1990-05-12'), p1.Endereco = 'Rua das Flores, 123', p1.Telefone = '(11) 98765-4321';

MERGE (p2:Paciente {CodPac: 2})
ON CREATE SET p2.NomePac = 'Bruno Costa', p2.CPF = '234.567.890-12', p2.DataNasc = date('1985-08-19'), p2.Endereco = 'Av. Paulista, 456', p2.Telefone = '(11) 91234-5678';

MERGE (p3:Paciente {CodPac: 3})
ON CREATE SET p3.NomePac = 'Carla Mendes', p3.CPF = '345.678.901-23', p3.DataNasc = date('1993-11-22'), p3.Endereco = 'Rua Afonso Pena, 789', p3.Telefone = '(21) 99876-5432';

MERGE (p4:Paciente {CodPac: 4})
ON CREATE SET p4.NomePac = 'Daniel Ferreira', p4.CPF = '456.789.012-34', p4.DataNasc = date('1988-03-15'), p4.Endereco = 'Praça Central, 101', p4.Telefone = '(31) 92345-6789';

MERGE (p5:Paciente {CodPac: 5})
ON CREATE SET p5.NomePac = 'Elaine Rocha', p5.CPF = '567.890.123-45', p5.DataNasc = date('1995-07-07'), p5.Endereco = 'Rua dos Lírios, 202', p5.Telefone = '(41) 93210-9876';

MERGE (p6:Paciente {CodPac: 6})
ON CREATE SET p6.NomePac = 'Fábio Ribeiro', p6.CPF = '678.901.234-56', p6.DataNasc = date('1991-12-03'), p6.Endereco = 'Av. das Palmeiras, 303', p6.Telefone = '(51) 94432-1567';

MERGE (p7:Paciente {CodPac: 7})
ON CREATE SET p7.NomePac = 'Gustavo Lima', p7.CPF = '789.012.345-67', p7.DataNasc = date('1987-09-10'), p7.Endereco = 'Rua das Orquídeas, 404', p7.Telefone = '(61) 95543-2678';

MERGE (p8:Paciente {CodPac: 8})
ON CREATE SET p8.NomePac = 'Heloísa Martins', p8.CPF = '890.123.456-78', p8.DataNasc = date('1994-01-18'), p8.Endereco = 'Av. Principal, 505', p8.Telefone = '(71) 96654-3789';

MERGE (p9:Paciente {CodPac: 9})
ON CREATE SET p9.NomePac = 'Isabela Fonseca', p9.CPF = '901.234.567-89', p9.DataNasc = date('1992-06-25'), p9.Endereco = 'Rua Secundária, 606', p9.Telefone = '(81) 97765-4890';

MERGE (p10:Paciente {CodPac: 10})
ON CREATE SET p10.NomePac = 'João Alves', p10.CPF = '012.345.678-90', p10.DataNasc = date('1989-04-09'), p10.Endereco = 'Praça Nova, 707', p10.Telefone = '(91) 98876-5901';

MERGE (p11:Paciente {CodPac: 11})
ON CREATE SET p11.NomePac = 'Karina Oliveira', p11.CPF = '123.654.987-01', p11.DataNasc = date('1996-02-28'), p11.Endereco = 'Av. do Sol, 808', p11.Telefone = '(31) 99987-1122';

MERGE (p12:Paciente {CodPac: 12})
ON CREATE SET p12.NomePac = 'Leonardo Santos', p12.CPF = '234.765.098-12', p12.DataNasc = date('1984-10-14'), p12.Endereco = 'Rua Nova Esperança, 909', p12.Telefone = '(41) 91123-2233';

MERGE (p13:Paciente {CodPac: 13})
ON CREATE SET p13.NomePac = 'Mariana Costa', p13.CPF = '345.876.109-23', p13.DataNasc = date('1997-08-21'), p13.Endereco = 'Rua das Rosas, 1010', p13.Telefone = '(51) 92234-3344';

MERGE (p14:Paciente {CodPac: 14})
ON CREATE SET p14.NomePac = 'Nathália Ribeiro', p14.CPF = '456.987.210-34', p14.DataNasc = date('1986-11-30'), p14.Endereco = 'Av. da Paz, 1111', p14.Telefone = '(61) 93345-4455';

MERGE (p15:Paciente {CodPac: 15})
ON CREATE SET p15.NomePac = 'Otávio Souza', p15.CPF = '567.098.321-45', p15.DataNasc = date('1993-07-04'), p15.Endereco = 'Praça das Águas, 1212', p15.Telefone = '(71) 94456-5566';

MERGE (p15:Paciente {CodPac: 16})
ON CREATE SET p15.NomePac = 'Paulo Souza', p15.CPF = '567.098.321-45', p15.DataNasc = date('1993-07-04'), p15.Endereco = 'Praça das Águas, 1212', p15.Telefone = '(71) 94456-5566';
