'use client';

import React, { useState, useEffect } from 'react';
import Layout from '../../components/Layout';

interface Medico {
    NomeMedico: string;
    CRM: string;
    Especializacao: string;
    CodigoFuncionario: number;
    Vinculo: string;
}

interface Especializacao {
    Especializacao: string;
}

export default function MedicosPage() {
    const [medicos, setMedicos] = useState<Medico[]>([]);
    const [especializacoes, setEspecializacoes] = useState<Especializacao[]>([]);
    const [selectedEspecializacao, setSelectedEspecializacao] = useState<string>('Cardiologia');
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        loadEspecializacoes();
    }, []);

    useEffect(() => {
        loadMedicos();
    }, [selectedEspecializacao]);

    const loadEspecializacoes = async () => {
        try {
            const response = await fetch('/api/medicos', {
                method: 'POST'
            });

            if (!response.ok) {
                throw new Error('Erro ao carregar especializações');
            }

            const data = await response.json();
            console.log('🔍 Especializações da API:', data);
            setEspecializacoes(data.data || []);
        } catch (error) {
            console.error('Erro ao carregar especializações:', error);
            // Continuar mesmo com erro, usando valor padrão
        }
    };

    const loadMedicos = async () => {
        try {
            setLoading(true);
            const url = `/api/medicos?especializacao=${encodeURIComponent(selectedEspecializacao)}`;
            const response = await fetch(url);

            if (!response.ok) {
                throw new Error('Erro ao carregar médicos');
            }

            const data = await response.json();
            console.log('🔍 Médicos da API:', data);
            setMedicos(data.data || []);
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
                        Médicos
                    </h1>
                    <p className="text-gray-600">
                        Lista de médicos por especialização
                    </p>
                </div>

                {/* Filtro de Especialização */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    <label htmlFor="especializacao" className="block text-sm font-medium text-gray-700 mb-2">
                        Filtrar por Especialização:
                    </label>
                    <select
                        id="especializacao"
                        value={selectedEspecializacao}
                        onChange={(e) => setSelectedEspecializacao(e.target.value)}
                        className="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500"
                    >
                        <option value="Cardiologia">Cardiologia</option>
                        {especializacoes.map((esp) => (
                            <option key={esp.Especializacao} value={esp.Especializacao}>
                                {esp.Especializacao}
                            </option>
                        ))}
                    </select>
                </div>

                {/* Conteúdo */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    {loading && (
                        <div className="flex items-center justify-center py-8">
                            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                            <span className="ml-3 text-gray-600">Carregando médicos...</span>
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
                                            Nome
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            CRM
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Especialização
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Código Funcionário
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Vínculo
                                        </th>
                                    </tr>
                                </thead>
                                <tbody className="bg-white divide-y divide-gray-200">
                                    {medicos.map((medico, index) => (
                                        <tr key={`${medico.CRM}-${index}`} className="hover:bg-gray-50">
                                            <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                {medico.NomeMedico}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {medico.CRM}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {medico.Especializacao}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {medico.CodigoFuncionario}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                {medico.Vinculo}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>

                            {medicos.length === 0 && (
                                <div className="text-center py-8">
                                    <p className="text-gray-500">
                                        Nenhum médico encontrado para a especialização "{selectedEspecializacao}"
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
