// src/app/api/pacientes/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { neo4jConnection } from '../../../../lib/neo4j';

// Consulta 3: Encontrar todos os Pacientes nascidos após '1990-01-01'
export async function GET(request: NextRequest) {
    try {
        const { searchParams } = new URL(request.url);
        const dataMinima = searchParams.get('dataMinima') || '1990-01-01';

        const query = `
      MATCH (p:Paciente)
      WHERE p.DataNasc > date($dataMinima)
      RETURN p.NomePac AS NomePaciente, 
             p.DataNasc AS DataNascimento, 
             p.CPF AS CPF,
             p.CodPac AS CodigoPaciente
      ORDER BY p.DataNasc ASC
    `;

        const result = await neo4jConnection.executeQuery(query, { dataMinima });

        // Converter os dados para formato JavaScript nativo
        const formattedData = result.map(record => {
            // Converter data do Neo4j para string ISO
            let dataFormatada = record.DataNascimento;
            if (record.DataNascimento && typeof record.DataNascimento === 'object') {
                if (record.DataNascimento.year && record.DataNascimento.month && record.DataNascimento.day) {
                    // Neo4j Date object
                    dataFormatada = `${record.DataNascimento.year.low || record.DataNascimento.year}-${String(record.DataNascimento.month.low || record.DataNascimento.month).padStart(2, '0')}-${String(record.DataNascimento.day.low || record.DataNascimento.day).padStart(2, '0')}`;
                } else if (record.DataNascimento.toString) {
                    dataFormatada = record.DataNascimento.toString();
                }
            }

            return {
                NomePaciente: record.NomePaciente,
                DataNascimento: dataFormatada,
                CPF: record.CPF,
                CodigoPaciente: typeof record.CodigoPaciente === 'object' && record.CodigoPaciente !== null
                    ? record.CodigoPaciente.low || record.CodigoPaciente.toNumber?.() || record.CodigoPaciente
                    : record.CodigoPaciente
            };
        });

        return NextResponse.json({
            success: true,
            data: formattedData,
            count: formattedData.length,
            filter: { dataMinima }
        });

    } catch (error) {
        console.error('Erro na API de pacientes:', error);
        return NextResponse.json(
            {
                success: false,
                error: 'Erro ao buscar pacientes',
                details: error instanceof Error ? error.message : 'Erro desconhecido'
            },
            { status: 500 }
        );
    }
}
