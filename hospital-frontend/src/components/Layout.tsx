// src/components/Layout.tsx
'use client';

import React from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';

interface LayoutProps {
    children: React.ReactNode;
}

export default function Layout({ children }: LayoutProps) {
    const pathname = usePathname();

    const navigation = [
        { name: 'Dashboard', href: '/', icon: '🏠' },
        { name: 'Funcionários', href: '/funcionarios', icon: '👥' },
        { name: 'Médicos', href: '/medicos', icon: '👨‍⚕️' },
        { name: 'Pacientes', href: '/pacientes', icon: '🤕' },
        { name: 'Remédios', href: '/remedios', icon: '💊' },
        { name: 'Consultas', href: '/consultas', icon: '📋' },
    ];

    return (
        <div className="min-h-screen bg-gray-100">
            {/* Header */}
            <header className="bg-white shadow-sm border-b border-gray-200">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="flex justify-between h-16 items-center">
                        <div className="flex items-center">
                            <span className="text-2xl">🏥</span>
                            <h1 className="ml-3 text-xl font-bold text-gray-900">
                                Sistema Hospitalar - Neo4j
                            </h1>
                        </div>
                        <div className="text-sm text-gray-500">
                            Projeto AIBD - Banco de Grafos
                        </div>
                    </div>
                </div>
            </header>

            <div className="flex">
                {/* Sidebar */}
                <nav className="w-64 bg-white shadow-sm min-h-screen">
                    <div className="p-4">
                        <div className="space-y-2">
                            {navigation.map((item) => {
                                const isActive = pathname === item.href;
                                return (
                                    <Link
                                        key={item.name}
                                        href={item.href}
                                        className={`flex items-center px-3 py-2 rounded-md text-sm font-medium transition-colors ${isActive
                                                ? 'bg-blue-100 text-blue-900 border-r-2 border-blue-600'
                                                : 'text-gray-700 hover:bg-gray-100 hover:text-gray-900'
                                            }`}
                                    >
                                        <span className="mr-3 text-lg">{item.icon}</span>
                                        {item.name}
                                    </Link>
                                );
                            })}
                        </div>
                    </div>
                </nav>

                {/* Main content */}
                <main className="flex-1 p-6">
                    <div className="max-w-7xl mx-auto">
                        {children}
                    </div>
                </main>
            </div>
        </div>
    );
}
