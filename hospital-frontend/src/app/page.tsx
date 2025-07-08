// src/app/page.tsx
'use client';

import React, { useState, useEffect } from 'react';
import Layout from '../components/Layout';

export default function Home() {
  const [stats, setStats] = useState<any>(null);
  const [connectionStatus, setConnectionStatus] = useState<'loading' | 'connected' | 'error'>('loading');

  useEffect(() => {
    checkConnection();
    loadStats();
  }, []);

  const checkConnection = async () => {
    try {
      const response = await fetch('/api/funcionarios');
      if (response.ok) {
        setConnectionStatus('connected');
      } else {
        setConnectionStatus('error');
      }
    } catch (error) {
      setConnectionStatus('error');
    }
  };

  const loadStats = async () => {
    try {
      // Carregar estatísticas básicas da home
      const [funcionarios, medicos, pacientes, remedios] = await Promise.all([
        fetch('/api/funcionarios').then(r => r.json()),
        fetch('/api/medicos').then(r => r.json()),
        fetch('/api/pacientes').then(r => r.json()),
        fetch('/api/remedios').then(r => r.json())
      ]);

      setStats({
        funcionarios: funcionarios.count || 0,
        medicos: medicos.count || 0,
        pacientes: pacientes.count || 0,
        remedios: remedios.count || 0
      });
    } catch (error) {
      console.error('Erro ao carregar estatísticas:', error);
    }
  };

  return (
    <Layout>
      <div className="space-y-6">
        {/* Header */}
        <div className="bg-white shadow-lg rounded-lg p-6">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">
            Dashboard - Sistema Hospitalar
          </h1>
          <p className="text-gray-600">
            Sistema de gerenciamento hospitalar usando Neo4j como banco de dados de grafos
          </p>
        </div>

        {/* Status da Conexão */}
        <div className="bg-white shadow-lg rounded-lg p-6">
          <h2 className="text-xl font-semibold text-gray-800 mb-4">Status da Conexão Neo4j</h2>
          <div className="flex items-center">
            {connectionStatus === 'loading' && (
              <>
                <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-yellow-600 mr-3"></div>
                <span className="text-yellow-600">Verificando conexão...</span>
              </>
            )}
            {connectionStatus === 'connected' && (
              <>
                <div className="h-3 w-3 bg-green-500 rounded-full mr-3"></div>
                <span className="text-green-600 font-medium">Conectado ao Neo4j Desktop</span>
              </>
            )}
            {connectionStatus === 'error' && (
              <>
                <div className="h-3 w-3 bg-red-500 rounded-full mr-3"></div>
                <span className="text-red-600 font-medium">Erro de conexão - Verifique o Neo4j Desktop</span>
              </>
            )}
          </div>
        </div>

        {/* Estatísticas */}
        {stats && (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
            <div className="bg-white shadow-lg rounded-lg p-6">
              <div className="flex items-center">
                <div className="text-3xl mr-4">👥</div>
                <div>
                  <h3 className="text-lg font-semibold text-gray-700">Funcionários</h3>
                  <p className="text-2xl font-bold text-blue-600">{stats.funcionarios}</p>
                </div>
              </div>
            </div>

            <div className="bg-white shadow-lg rounded-lg p-6">
              <div className="flex items-center">
                <div className="text-3xl mr-4">👨‍⚕️</div>
                <div>
                  <h3 className="text-lg font-semibold text-gray-700">Médicos</h3>
                  <p className="text-2xl font-bold text-green-600">{stats.medicos}</p>
                </div>
              </div>
            </div>

            <div className="bg-white shadow-lg rounded-lg p-6">
              <div className="flex items-center">
                <div className="text-3xl mr-4">🤕</div>
                <div>
                  <h3 className="text-lg font-semibold text-gray-700">Pacientes</h3>
                  <p className="text-2xl font-bold text-purple-600">{stats.pacientes}</p>
                </div>
              </div>
            </div>

            <div className="bg-white shadow-lg rounded-lg p-6">
              <div className="flex items-center">
                <div className="text-3xl mr-4">💊</div>
                <div>
                  <h3 className="text-lg font-semibold text-gray-700">Remédios</h3>
                  <p className="text-2xl font-bold text-orange-600">{stats.remedios}</p>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Informações do Projeto */}
        <div className="bg-white shadow-lg rounded-lg p-6">
          <h2 className="text-xl font-semibold text-gray-800 mb-4">Sobre o Projeto</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <h3 className="font-semibold text-gray-700 mb-2">Tecnologias Utilizadas</h3>
              <ul className="text-sm text-gray-600 space-y-1">
                <li>• Next.js 15 (React Framework)</li>
                <li>• TypeScript</li>
                <li>• Tailwind CSS</li>
                <li>• Neo4j Database</li>
                <li>• neo4j-driver</li>
              </ul>
            </div>
            <div>
              <h3 className="font-semibold text-gray-700 mb-2">Funcionalidades</h3>
              <ul className="text-sm text-gray-600 space-y-1">
                <li>• Consulta de funcionários e especializações</li>
                <li>• Filtros por data de nascimento</li>
                <li>• Listagem de remédios controlados</li>
                <li>• Relatórios de consultas por período</li>
                <li>• Interface responsiva e moderna</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </Layout>
  );
}
