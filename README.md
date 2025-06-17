# projeto-aibd
Projeto da disciplina de Aspectos de Implementação de Banco de Dados

- Rótulos Múltiplos para Especialização: A abordagem de rótulos múltiplos (:Funcionario:Medico, :Funcionario:Enfermeiro) é eficiente e flexível para lidar com hierarquias de tipo.
- Nós para Eventos/Entidades Centrais: A tabela Consulta foi modelada como um nó central (:Consulta) para representar o evento da consulta em si, com vários relacionamentos "entrando" e "saindo" dele, conectando os participantes e recursos. Isso é muito natural para modelos de grafo.
- Propriedades em Relacionamentos: As tabelas de junção como Administrativo e Estoque foram convertidas em relacionamentos que carregam as propriedades adicionais (Cargo, DataCompra, Quantidade), o que é uma prática recomendada no Neo4j.
- Tipos de Dados: Datas e Horas no SQL foram convertidas para os tipos nativos de Data (date()) e Hora (time()) do Neo4j.