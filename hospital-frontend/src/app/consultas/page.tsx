'use client';

import React, { useState, useEffect } from 'react';
import Layout from '../../components/Layout';

interface Consulta {
    NomeMedico: string;
    NomePaciente: string;
    DataConsulta: string;
    HoraConsulta: string;
    CRM: string;
    Especializacao: string;
}

export default function ConsultasPage() {
    const [consultas, setConsultas] = useState<Consulta[]>([]);
    const [ano, setAno] = useState<number>(2025);
    const [mes, setMes] = useState<number>(1);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        loadConsultas();
    }, [ano, mes]);

    const loadConsultas = async () => {
        try {
            setLoading(true);
            const url = `/api/consultas?ano=${ano}&mes=${mes}`;
            const response = await fetch(url);

            if (!response.ok) {
                throw new Error('Erro ao carregar consultas');
            }

            const data = await response.json();
            console.log('🔍 Consultas da API:', data);
            setConsultas(data.data || []);
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

    const meses = [
        { value: 1, label: 'Janeiro' },
        { value: 2, label: 'Fevereiro' },
        { value: 3, label: 'Março' },
        { value: 4, label: 'Abril' },
        { value: 5, label: 'Maio' },
        { value: 6, label: 'Junho' },
        { value: 7, label: 'Julho' },
        { value: 8, label: 'Agosto' },
        { value: 9, label: 'Setembro' },
        { value: 10, label: 'Outubro' },
        { value: 11, label: 'Novembro' },
        { value: 12, label: 'Dezembro' }
    ];

    return (
        <Layout>
            <div className="space-y-6">
                {/* Header */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    <h1 className="text-3xl font-bold text-gray-900 mb-2">
                        Consultas
                    </h1>
                    <p className="text-gray-600">
                        Lista de consultas realizadas por médicos em um período específico
                    </p>
                </div>

                {/* Filtros de Período */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label htmlFor="ano" className="block text-sm font-medium text-gray-700 mb-2">
                                Ano:
                            </label>
                            <input
                                type="number"
                                id="ano"
                                value={ano}
                                onChange={(e) => setAno(parseInt(e.target.value) || 2025)}
                                min="2020"
                                max="2030"
                                className="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                            />
                        </div>
                        <div>
                            <label htmlFor="mes" className="block text-sm font-medium text-gray-700 mb-2">
                                Mês:
                            </label>
                            <select
                                id="mes"
                                value={mes}
                                onChange={(e) => setMes(parseInt(e.target.value))}
                                className="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                            >
                                {meses.map((m) => (
                                    <option key={m.value} value={m.value}>
                                        {m.label}
                                    </option>
                                ))}
                            </select>
                        </div>
                    </div>
                    <p className="mt-3 text-sm text-gray-500">
                        Mostrando consultas de {meses.find(m => m.value === mes)?.label} de {ano}
                    </p>
                </div>

                {/* Conteúdo */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    {loading && (
                        <div className="flex items-center justify-center py-8">
                            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                            <span className="ml-3 text-gray-600">Carregando consultas...</span>
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
                                            Data
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Hora
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Médico
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            CRM
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Especialização
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Paciente
                                        </th>
                                    </tr>
                                </thead>
                                <tbody className="bg-white divide-y divide-gray-200">
                                    {consultas.map((consulta, index) => (
                                        <tr key={`${consulta.CRM}-${index}`} className="hover:bg-gray-50">
                                            <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                {formatDate(consulta.DataConsulta)}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {consulta.HoraConsulta}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {consulta.NomeMedico}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {consulta.CRM}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {consulta.Especializacao}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                {consulta.NomePaciente}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>

                            {consultas.length === 0 && (
                                <div className="text-center py-8">
                                    <p className="text-gray-500">
                                        Nenhuma consulta encontrada para {meses.find(m => m.value === mes)?.label} de {ano}
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
