// src/app/api/consultas/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { neo4jConnection } from '../../../../lib/neo4j';

// Consulta 6: Encontrar todos os Médicos que realizaram uma consulta em um mês específico
export async function GET(request: NextRequest) {
    try {
        const { searchParams } = new URL(request.url);
        const ano = parseInt(searchParams.get('ano') || '2025');
        const mes = parseInt(searchParams.get('mes') || '1');

        const query = `
      MATCH (m:Medico)-[:REALIZA]->(co:Consulta)<-[:EH_PACIENTE_DA_CONSULTA]-(p:Paciente)
      WHERE co.Dia.year = $ano AND co.Dia.month = $mes
      RETURN m.Nome AS NomeMedico, 
             p.NomePac AS NomePaciente, 
             co.Dia AS DataConsulta, 
             co.Hora AS HoraConsulta,
             m.CRM AS CRM,
             m.Especializacao AS Especializacao
      ORDER BY NomeMedico, DataConsulta, HoraConsulta
    `;

        const result = await neo4jConnection.executeQuery(query, { ano, mes });

        // Converter os dados para formato JavaScript nativo
        const formattedData = result.map(record => {
            // Converter data do Neo4j para string ISO
            let dataFormatada = record.DataConsulta;
            if (record.DataConsulta && typeof record.DataConsulta === 'object') {
                if (record.DataConsulta.year && record.DataConsulta.month && record.DataConsulta.day) {
                    // Neo4j Date object
                    dataFormatada = `${record.DataConsulta.year.low || record.DataConsulta.year}-${String(record.DataConsulta.month.low || record.DataConsulta.month).padStart(2, '0')}-${String(record.DataConsulta.day.low || record.DataConsulta.day).padStart(2, '0')}`;
                } else if (record.DataConsulta.toString) {
                    dataFormatada = record.DataConsulta.toString();
                }
            }

            // Converter horário do Neo4j
            let horaFormatada = record.HoraConsulta;
            if (record.HoraConsulta && typeof record.HoraConsulta === 'object') {
                if (record.HoraConsulta.hour !== undefined && record.HoraConsulta.minute !== undefined) {
                    const hora = record.HoraConsulta.hour.low || record.HoraConsulta.hour;
                    const minuto = record.HoraConsulta.minute.low || record.HoraConsulta.minute;
                    horaFormatada = `${String(hora).padStart(2, '0')}:${String(minuto).padStart(2, '0')}`;
                } else if (record.HoraConsulta.toString) {
                    horaFormatada = record.HoraConsulta.toString();
                }
            }

            return {
                NomeMedico: record.NomeMedico,
                NomePaciente: record.NomePaciente,
                DataConsulta: dataFormatada,
                HoraConsulta: horaFormatada,
                CRM: record.CRM,
                Especializacao: record.Especializacao
            };
        });

        return NextResponse.json({
            success: true,
            data: formattedData,
            count: formattedData.length,
            filter: { ano, mes }
        });

    } catch (error) {
        console.error('Erro na API de consultas:', error);
        return NextResponse.json(
            {
                success: false,
                error: 'Erro ao buscar consultas',
                details: error instanceof Error ? error.message : 'Erro desconhecido'
            },
            { status: 500 }
        );
    }
}
