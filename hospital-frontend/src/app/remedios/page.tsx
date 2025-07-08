'use client';

import React, { useState, useEffect } from 'react';
import Layout from '../../components/Layout';

interface Remedio {
    NomeRemedio: string;
    TipoRemedio: string;
    EhControlado: boolean;
    CodigoRemedio: number;
}

export default function RemediosPage() {
    const [remedios, setRemedios] = useState<Remedio[]>([]);
    const [filtroControlado, setFiltroControlado] = useState<boolean>(true);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        loadRemedios();
    }, [filtroControlado]);

    const loadRemedios = async () => {
        try {
            setLoading(true);
            const url = `/api/remedios?controlado=${filtroControlado}`;
            const response = await fetch(url);

            if (!response.ok) {
                throw new Error('Erro ao carregar remédios');
            }

            const data = await response.json();
            console.log('🔍 Remédios da API:', data);
            setRemedios(data.data || []);
        } catch (error) {
            setError(error instanceof Error ? error.message : 'Erro desconhecido');
        } finally {
            setLoading(false);
        }
    };

    return (
        <Layout>
            <div className="space-y-6">
                {/* Header */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    <h1 className="text-3xl font-bold text-gray-900 mb-2">
                        Remédios
                    </h1>
                    <p className="text-gray-600">
                        Lista de remédios filtrados por tipo de controle
                    </p>
                </div>

                {/* Filtro de Controle */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    <label className="block text-sm font-medium text-gray-700 mb-3">
                        Filtrar por tipo:
                    </label>
                    <div className="flex space-x-4">
                        <label className="inline-flex items-center">
                            <input
                                type="radio"
                                name="controlado"
                                value="true"
                                checked={filtroControlado === true}
                                onChange={() => setFiltroControlado(true)}
                                className="form-radio h-4 w-4 text-blue-600 transition duration-150 ease-in-out"
                            />
                            <span className="ml-2 text-sm text-gray-700">Remédios Controlados</span>
                        </label>
                        <label className="inline-flex items-center">
                            <input
                                type="radio"
                                name="controlado"
                                value="false"
                                checked={filtroControlado === false}
                                onChange={() => setFiltroControlado(false)}
                                className="form-radio h-4 w-4 text-blue-600 transition duration-150 ease-in-out"
                            />
                            <span className="ml-2 text-sm text-gray-700">Remédios Não Controlados</span>
                        </label>
                    </div>
                    <p className="mt-2 text-sm text-gray-500">
                        Mostrando {filtroControlado ? 'remédios controlados' : 'remédios não controlados'}
                    </p>
                </div>

                {/* Conteúdo */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    {loading && (
                        <div className="flex items-center justify-center py-8">
                            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                            <span className="ml-3 text-gray-600">Carregando remédios...</span>
                        </div>
                    )}

                    {error && (
                        <div className="bg-red-50 border border-red-200 rounded-lg p-4">
                            <p className="text-red-600">❌ {error}</p>
                        </div>
                    )}

                    {!loading && !error && (
                        <div className="overflow-x-auto">
                            <table className="min-w-full divide-y divide-gray-200">
                                <thead className="bg-gray-50">
                                    <tr>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Código
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Nome do Remédio
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Tipo
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Status
                                        </th>
                                    </tr>
                                </thead>
                                <tbody className="bg-white divide-y divide-gray-200">
                                    {remedios.map((remedio) => (
                                        <tr key={remedio.CodigoRemedio} className="hover:bg-gray-50">
                                            <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                {remedio.CodigoRemedio}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {remedio.NomeRemedio}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {remedio.TipoRemedio}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm">
                                                {remedio.EhControlado ? (
                                                    <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                                        🔒 Controlado
                                                    </span>
                                                ) : (
                                                    <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                                        ✅ Livre
                                                    </span>
                                                )}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>

                            {remedios.length === 0 && (
                                <div className="text-center py-8">
                                    <p className="text-gray-500">
                                        Nenhum remédio {filtroControlado ? 'controlado' : 'não controlado'} encontrado
                                    </p>
                                </div>
                            )}
                        </div>
                    )}
                </div>
            </div>
        </Layout>
    );
}
