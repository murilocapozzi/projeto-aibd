// src/components/DataTable.tsx
'use client';

import React from 'react';

interface Column {
    key: string;
    label: string;
    render?: (value: any, row: any) => React.ReactNode;
}

interface DataTableProps {
    data: any[];
    columns: Column[];
    title: string;
    loading?: boolean;
    error?: string;
}

export default function DataTable({ data, columns, title, loading, error }: DataTableProps) {
    if (loading) {
        return (
            <div className="bg-white shadow-lg rounded-lg p-6">
                <h2 className="text-2xl font-bold text-gray-800 mb-6">{title}</h2>
                <div className="flex items-center justify-center py-8">
                    <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
                    <span className="ml-3 text-gray-600">Carregando...</span>
                </div>
            </div>
        );
    }

    if (error) {
        return (
            <div className="bg-white shadow-lg rounded-lg p-6">
                <h2 className="text-2xl font-bold text-gray-800 mb-6">{title}</h2>
                <div className="bg-red-50 border border-red-200 rounded-md p-4">
                    <div className="flex">
                        <div className="ml-3">
                            <h3 className="text-sm font-medium text-red-800">Erro</h3>
                            <div className="mt-2 text-sm text-red-700">{error}</div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }

    if (!data || data.length === 0) {
        return (
            <div className="bg-white shadow-lg rounded-lg p-6">
                <h2 className="text-2xl font-bold text-gray-800 mb-6">{title}</h2>
                <div className="text-center py-8 text-gray-500">
                    Nenhum dado encontrado
                </div>
            </div>
        );
    }

    return (
        <div className="bg-white shadow-lg rounded-lg overflow-hidden">
            <div className="px-6 py-4 border-b border-gray-200">
                <h2 className="text-2xl font-bold text-gray-800">{title}</h2>
                <p className="text-sm text-gray-600 mt-1">
                    {data.length} registro{data.length !== 1 ? 's' : ''} encontrado{data.length !== 1 ? 's' : ''}
                </p>
            </div>

            <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                    <thead className="bg-gray-50">
                        <tr>
                            {columns.map((column) => (
                                <th
                                    key={column.key}
                                    className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                                >
                                    {column.label}
                                </th>
                            ))}
                        </tr>
                    </thead>
                    <tbody className="bg-white divide-y divide-gray-200">
                        {data.map((row, index) => (
                            <tr key={index} className="hover:bg-gray-50">
                                {columns.map((column) => (
                                    <td
                                        key={column.key}
                                        className="px-6 py-4 whitespace-nowrap text-sm text-gray-900"
                                    >
                                        {column.render
                                            ? column.render(row[column.key], row)
                                            : Array.isArray(row[column.key])
                                                ? row[column.key].join(', ')
                                                : row[column.key] || '-'
                                        }
                                    </td>
                                ))}
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
}
