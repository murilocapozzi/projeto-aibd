'use client';

import React, { useState, useEffect } from 'react';
import Layout from '../../components/Layout';

interface Funcionario {
    CodigoFuncionario: number;
    NomeFuncionario: string;
    Vinculo: string;
    TiposDeFuncionario: string[];
}

export default function FuncionariosPage() {
    const [funcionarios, setFuncionarios] = useState<Funcionario[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        loadFuncionarios();
    }, []);

    const loadFuncionarios = async () => {
        try {
            setLoading(true);
            const response = await fetch('/api/funcionarios');

            if (!response.ok) {
                throw new Error('Erro ao carregar funcionários');
            }

            const data = await response.json();

            // Debug: vamos ver o que realmente está vindo da API
            console.log('🔍 Dados da API:', data);

            // Agora os dados já vêm formatados da API
            setFuncionarios(data.data || []);
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
                        Funcionários
                    </h1>
                    <p className="text-gray-600">
                        Lista de todos os funcionários do hospital e seus vínculos
                    </p>
                </div>

                {/* Conteúdo */}
                <div className="bg-white shadow-lg rounded-lg p-6">
                    {loading && (
                        <div className="flex items-center justify-center py-8">
                            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                            <span className="ml-3 text-gray-600">Carregando funcionários...</span>
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
                                            Vínculo
                                        </th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Tipos
                                        </th>
                                    </tr>
                                </thead>
                                <tbody className="bg-white divide-y divide-gray-200">
                                    {funcionarios.map((funcionario) => (
                                        <tr key={funcionario.CodigoFuncionario} className="hover:bg-gray-50">
                                            <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                                {funcionario.CodigoFuncionario}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {funcionario.NomeFuncionario}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                                                {funcionario.Vinculo}
                                            </td>
                                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                {funcionario.TiposDeFuncionario.join(', ')}
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>

                            {funcionarios.length === 0 && (
                                <div className="text-center py-8">
                                    <p className="text-gray-500">Nenhum funcionário encontrado</p>
                                </div>
                            )}
                        </div>
                    )}
                </div>
            </div>
        </Layout>
    );
}
