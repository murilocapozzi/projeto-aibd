// src/app/api/medicos/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { neo4jConnection } from '../../../../lib/neo4j';

// Consulta 2: Encontrar todos os Médicos especializados em 'Cardiologia'
export async function GET(request: NextRequest) {
    try {
        const { searchParams } = new URL(request.url);
        const especializacao = searchParams.get('especializacao') || 'Cardiologia';

        const query = `
      MATCH (m:Medico)
      WHERE m.Especializacao = $especializacao
      RETURN m.Nome AS NomeMedico, 
             m.CRM AS CRM, 
             m.Especializacao AS Especializacao,
             m.CodFunc AS CodigoFuncionario,
             m.Vinculo AS Vinculo
      ORDER BY m.Nome
    `;

        const result = await neo4jConnection.executeQuery(query, { especializacao });

        // Converter os dados para formato JavaScript nativo
        const formattedData = result.map(record => ({
            NomeMedico: record.NomeMedico,
            CRM: record.CRM,
            Especializacao: record.Especializacao,
            CodigoFuncionario: typeof record.CodigoFuncionario === 'object' && record.CodigoFuncionario !== null
                ? record.CodigoFuncionario.low || record.CodigoFuncionario.toNumber?.() || record.CodigoFuncionario
                : record.CodigoFuncionario,
            Vinculo: record.Vinculo
        }));

        return NextResponse.json({
            success: true,
            data: formattedData,
            count: formattedData.length,
            filter: { especializacao }
        });

    } catch (error) {
        console.error('Erro na API de médicos:', error);
        return NextResponse.json(
            {
                success: false,
                error: 'Erro ao buscar médicos',
                details: error instanceof Error ? error.message : 'Erro desconhecido'
            },
            { status: 500 }
        );
    }
}

// GET para listar todas as especializações disponíveis
export async function POST(request: NextRequest) {
    try {
        const query = `
      MATCH (m:Medico)
      RETURN DISTINCT m.Especializacao AS Especializacao
      ORDER BY m.Especializacao
    `;

        const result = await neo4jConnection.executeQuery(query);

        // Converter os dados para formato JavaScript nativo
        const formattedData = result.map(record => ({
            Especializacao: record.Especializacao
        }));

        return NextResponse.json({
            success: true,
            data: formattedData,
            count: formattedData.length
        });

    } catch (error) {
        console.error('Erro na API de especializações:', error);
        return NextResponse.json(
            {
                success: false,
                error: 'Erro ao buscar especializações',
                details: error instanceof Error ? error.message : 'Erro desconhecido'
            },
            { status: 500 }
        );
    }
}
