// test-neo4j.js - Teste de conexão simples se o não estiver funcionando
const neo4j = require('neo4j-driver');

async function testConnection() {
    const passwords = ['12345678', 'password'];

    for (const password of passwords) {
        console.log(`\nTentando senha: ${password}`);
        const driver = neo4j.driver(
            'bolt://127.0.0.1:7687',
            neo4j.auth.basic('neo4j', password)
        );

        try {
            await driver.verifyConnectivity();
            console.log('✅ Conexão bem-sucedida com senha:', password);

            // Teste simples de query
            const session = driver.session();
            const result = await session.run('RETURN "Hello Neo4j" as message');
            console.log('Resultado da query:', result.records[0].get('message'));
            await session.close();

            await driver.close();
            return password; // Retorna a senha que funcionou

        } catch (error) {
            console.error('❌ Erro:', error.code);
            await driver.close();
        }
    }

    console.log('\n❌ Nenhuma senha funcionou. Você precisa resetar a senha do Neo4j.');
}

testConnection();
