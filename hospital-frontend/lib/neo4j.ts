// lib/neo4j.ts - Configuração da conexão com Neo4j
import neo4j, { Driver, Session } from 'neo4j-driver';

class Neo4jConnection {
    private driver: Driver | null = null;
    private uri: string;
    private username: string;
    private password: string;

    constructor() {
        // Configuração para Neo4j Desktop (padrão)
        this.uri = process.env.NEO4J_URI || 'bolt://127.0.0.1:7687';
        this.username = process.env.NEO4J_USERNAME || 'neo4j';
        this.password = process.env.NEO4J_PASSWORD || '12345678';
    }

    // Conectar ao Neo4j
    async connect(): Promise<Driver> {
        if (!this.driver) {
            this.driver = neo4j.driver(
                this.uri,
                neo4j.auth.basic(this.username, this.password)
            );
        }
        return this.driver;
    }

    // Criar uma sessão
    async getSession(): Promise<Session> {
        const driver = await this.connect();
        return driver.session();
    }

    // Executar uma query
    async executeQuery(query: string, parameters: any = {}) {
        const session = await this.getSession();

        try {
            const result = await session.run(query, parameters);
            return result.records.map(record => record.toObject());
        } catch (error) {
            console.error('Erro ao executar query Neo4j:', error);
            throw error;
        } finally {
            await session.close();
        }
    }

    // Fechar a conexão
    async close(): Promise<void> {
        if (this.driver) {
            await this.driver.close();
            this.driver = null;
        }
    }

    // Verificar conectividade
    async verifyConnectivity(): Promise<boolean> {
        try {
            const driver = await this.connect();
            await driver.verifyConnectivity();
            return true;
        } catch (error) {
            console.error('Erro de conectividade Neo4j:', error);
            return false;
        }
    }
}

// Exportar uma instância única (singleton)
export const neo4jConnection = new Neo4jConnection();
export default neo4jConnection;
