// src/app/api/funcionarios/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { neo4jConnection } from '../../../../lib/neo4j';

// Consulta 1: Listar todos os Funcionários e seus rótulos (tipo de funcionário)
export async function GET(request: NextRequest) {
    try {
        const query = `
      MATCH (f:Funcionario)
      RETURN f.CodFunc AS CodigoFuncionario, 
             f.Nome AS NomeFuncionario, 
             f.Vinculo AS Vinculo, 
             labels(f) AS TiposDeFuncionario
      ORDER BY f.CodFunc
    `;

        const result = await neo4jConnection.executeQuery(query);

        // Converter dados Neo4j para JavaScript nativo
        const dadosFormatados = result.map((record: any) => ({
            CodigoFuncionario: record.CodigoFuncionario?.toNumber?.() || record.CodigoFuncionario?.low || Number(record.CodigoFuncionario) || 0,
            NomeFuncionario: String(record.NomeFuncionario || ''),
            Vinculo: String(record.Vinculo || ''),
            TiposDeFuncionario: Array.isArray(record.TiposDeFuncionario)
                ? record.TiposDeFuncionario.map((tipo: any) => String(tipo))
                : []
        }));

        return NextResponse.json({
            success: true,
            data: dadosFormatados,
            count: dadosFormatados.length
        });

    } catch (error) {
        console.error('Erro na API de funcionários:', error);
        return NextResponse.json(
            {
                success: false,
                error: 'Erro ao buscar funcionários',
                details: error instanceof Error ? error.message : 'Erro desconhecido'
            },
            { status: 500 }
        );
    }
}
