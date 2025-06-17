// Inserção de dados para a entidade Funcionario
// Usamos MERGE para criar o nó se ele não existir, e para corresponder a ele se já existir (evitando duplicações).

MERGE (f1:Funcionario {CodFunc: 1})
ON CREATE SET f1.Nome = 'João Silva', f1.Vinculo = 'CLT';

MERGE (f2:Funcionario {CodFunc: 2})
ON CREATE SET f2.Nome = 'Maria Oliveira', f2.Vinculo = 'CLT';

MERGE (f3:Funcionario {CodFunc: 3})
ON CREATE SET f3.Nome = 'Carlos Souza', f3.Vinculo = 'CNPJ';

MERGE (f4:Funcionario {CodFunc: 4})
ON CREATE SET f4.Nome = 'Yuri Baldi', f4.Vinculo = 'CNPJ';

MERGE (f5:Funcionario {CodFunc: 5})
ON CREATE SET f5.Nome = 'Roberson dos Santos', f5.Vinculo = 'CLT';

MERGE (f6:Funcionario {CodFunc: 6})
ON CREATE SET f6.Nome = 'Victor Marques', f6.Vinculo = 'CLT';

MERGE (f7:Funcionario {CodFunc: 7})
ON CREATE SET f7.Nome = 'Daniela Musa', f7.Vinculo = 'CNPJ';

MERGE (f8:Funcionario {CodFunc: 8})
ON CREATE SET f8.Nome = 'João Carneiro', f8.Vinculo = 'CNPJ';

MERGE (f9:Funcionario {CodFunc: 9})
ON CREATE SET f9.Nome = 'João Rocha', f9.Vinculo = 'CLT';

MERGE (f10:Funcionario {CodFunc: 10})
ON CREATE SET f10.Nome = 'Beatriz Silve', f10.Vinculo = 'CLT';

MERGE (f11:Funcionario {CodFunc: 11})
ON CREATE SET f11.Nome = 'Fernanda Almeida', f11.Vinculo = 'CLT';

MERGE (f12:Funcionario {CodFunc: 12})
ON CREATE SET f12.Nome = 'Carlos Mendes', f12.Vinculo = 'CNPJ';

MERGE (f13:Funcionario {CodFunc: 13})
ON CREATE SET f13.Nome = 'Roberto Farias', f13.Vinculo = 'CLT';

MERGE (f14:Funcionario {CodFunc: 14})
ON CREATE SET f14.Nome = 'Aline Castro', f14.Vinculo = 'CNPJ';

MERGE (f15:Funcionario {CodFunc: 15})
ON CREATE SET f15.Nome = 'Gustavo Lima', f15.Vinculo = 'CLT';

MERGE (f16:Funcionario {CodFunc: 16})
ON CREATE SET f16.Nome = 'Patrícia Fonseca', f16.Vinculo = 'CNPJ';

MERGE (f17:Funcionario {CodFunc: 17})
ON CREATE SET f17.Nome = 'Lucas Silva', f17.Vinculo = 'CLT';

MERGE (f18:Funcionario {CodFunc: 18})
ON CREATE SET f18.Nome = 'Ana Paula Santos', f18.Vinculo = 'CNPJ';

MERGE (f19:Funcionario {CodFunc: 19})
ON CREATE SET f19.Nome = 'Fábio Ribeiro', f19.Vinculo = 'CLT';

MERGE (f20:Funcionario {CodFunc: 20})
ON CREATE SET f20.Nome = 'Camila Teixeira', f20.Vinculo = 'CNPJ';

MERGE (f21:Funcionario {CodFunc: 21})
ON CREATE SET f21.Nome = 'Rafael Moreira', f21.Vinculo = 'CLT';

MERGE (f22:Funcionario {CodFunc: 22})
ON CREATE SET f22.Nome = 'Juliana Alves', f22.Vinculo = 'CLT';

MERGE (f23:Funcionario {CodFunc: 23})
ON CREATE SET f23.Nome = 'Marcos Vinícius', f23.Vinculo = 'CNPJ';

MERGE (f24:Funcionario {CodFunc: 24})
ON CREATE SET f24.Nome = 'Cláudia Rocha', f24.Vinculo = 'CLT';

MERGE (f25:Funcionario {CodFunc: 25})
ON CREATE SET f25.Nome = 'Eduardo Matos', f25.Vinculo = 'CNPJ';

MERGE (f26:Funcionario {CodFunc: 26})
ON CREATE SET f26.Nome = 'Renata Oliveira', f26.Vinculo = 'CLT';

MERGE (f27:Funcionario {CodFunc: 27})
ON CREATE SET f27.Nome = 'Thiago Ferreira', f27.Vinculo = 'CNPJ';

MERGE (f28:Funcionario {CodFunc: 28})
ON CREATE SET f28.Nome = 'Letícia Ramos', f28.Vinculo = 'CLT';

MERGE (f29:Funcionario {CodFunc: 29})
ON CREATE SET f29.Nome = 'Bruno Costa', f29.Vinculo = 'CLT';

MERGE (f30:Funcionario {CodFunc: 30})
ON CREATE SET f30.Nome = 'Viviane Santos', f30.Vinculo = 'CNPJ';
