'use client';

import React, { useState, useEffect } from 'react';
import Layout from '../../components/Layout';

interface Paciente {
    NomePaciente: string;
    DataNascimento: string;
    CPF: string;
    CodigoPaciente: number;
}

export default function PacientesPage() {
    const [pacientes, setPacientes] = useState<Paciente[]>([]);
    const [dataMinima, setDataMinima] = useState<string>('1990-01-01');
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        loadPacientes();
    }, [dataMinima]);

    const loadPacientes = async () => {
        try {
            setLoading(true);
            const url = `/api/pacientes?dataMinima=${encodeURIComponent(dataMinima)}`;
            const response = await fetch(url);

            if (!response.ok) {
                throw new Error('Erro ao carregar pacientes');
            }

            const data = await response.json();
            console.log('🔍 Pacientes da API:', data);
            setPacientes(data.data || []);
        } catch (error) {
            setError(error instanceof Error ? error.message : 'Erro desconhecido');
        } finally {
            setLoading(false);
        }
    };

    const formatDate = (dateString: string) => {
        if (!dateString) return 'Data inválida';
        try {
            // Se a data já está no formato YYYY-MM-DD, usar diretamente
            if (typeof dateString === 'string' && dateString.match(/^\d{4}-\d{2}-\d{2}$/)) {
                const [year, month, day] = dateString.split('-');
                return `${day}/${month}/${year}`;
            }

            // Tentar converter usando Date
            const date = new Date(dateString);
            if (isNaN(date.getTime())) {
                return dateString; // Retornar string original se não conseguir converter
            }
            return date.toLocaleDateString('pt-BR');
        } catch {
            return dateString || 'Data inválida';
        }
    };

    return (
        <Layout>
            <div className="space-y-6">
                {/* Header */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    <h1 className="text-3xl font-bold text-gray-900 mb-2">
                        Pacientes
                    </h1>
                    <p className="text-gray-600">
                        Lista de pacientes filtrados por data de nascimento
                    </p>
                </div>

                {/* Filtro de Data */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    <label htmlFor="dataMinima" className="block text-sm font-medium text-gray-700 mb-2">
                        Pacientes nascidos após:
                    </label>
                    <input
                        type="date"
                        id="dataMinima"
                        value={dataMinima}
                        onChange={(e) => setDataMinima(e.target.value)}
                        className="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                    />
                    <p className="mt-2 text-sm text-gray-500">
                        Filtrando pacientes nascidos após {formatDate(dataMinima)}
                    </p>
                </div>

                {/* Conteúdo */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    {loading && (
                        <div className="flex items-center justify-center py-8">
                            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                            <span className="ml-3 text-gray-600">Carregando pacientes...</span>
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
                                            Nome
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            CPF
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Data de Nascimento
                                        </th>
                                    </tr>
                                </thead>
                                <tbody className="bg-white divide-y divide-gray-200">
                                    {pacientes.map((paciente) => (
                                        <tr key={paciente.CodigoPaciente} className="hover:bg-gray-50">
                                            <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                {paciente.CodigoPaciente}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {paciente.NomePaciente}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {paciente.CPF}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                {formatDate(paciente.DataNascimento)}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>

                            {pacientes.length === 0 && (
                                <div className="text-center py-8">
                                    <p className="text-gray-500">
                                        Nenhum paciente encontrado nascido após {formatDate(dataMinima)}
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
