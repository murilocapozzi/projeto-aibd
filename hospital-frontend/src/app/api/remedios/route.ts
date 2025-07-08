// src/app/api/remedios/route.ts
import { NextRequest, NextResponse } from 'next/server';
import { neo4jConnection } from '../../../../lib/neo4j';

// Consulta 5: Listar todos os Remédios que são Controlados
export async function GET(request: NextRequest) {
    try {
        const { searchParams } = new URL(request.url);
        const controlado = searchParams.get('controlado') !== 'false'; // default true

        const query = `
      MATCH (r:Remedio)
      WHERE r.Controlado = $controlado
      RETURN r.NomeRem AS NomeRemedio, 
             r.Tipo AS TipoRemedio, 
             r.Controlado AS EhControlado,
             r.CodRem AS CodigoRemedio
      ORDER BY r.NomeRem
    `;

        const result = await neo4jConnection.executeQuery(query, { controlado });

        // Converter os dados para formato JavaScript nativo
        const formattedData = result.map(record => ({
            NomeRemedio: record.NomeRemedio,
            TipoRemedio: record.TipoRemedio,
            EhControlado: Boolean(record.EhControlado),
            CodigoRemedio: typeof record.CodigoRemedio === 'object' && record.CodigoRemedio !== null
                ? record.CodigoRemedio.low || record.CodigoRemedio.toNumber?.() || record.CodigoRemedio
                : record.CodigoRemedio
        }));

        return NextResponse.json({
            success: true,
            data: formattedData,
            count: formattedData.length,
            filter: { controlado }
        });

    } catch (error) {
        console.error('Erro na API de remédios:', error);
        return NextResponse.json(
            {
                success: false,
                error: 'Erro ao buscar remédios',
                details: error instanceof Error ? error.message : 'Erro desconhecido'
            },
            { status: 500 }
        );
    }
}
