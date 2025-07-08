# Iniciar servidor de desenvolvimento
dev:
	npm run dev

# Build do projeto
build:
	npm run build

# # Iniciar em produção
# start:
# 	npm run start

# Instalar dependências
install:
	npm install

# Limpar cache do Next.js
clean:
	Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue

# Limpar tudo e reinstalar
fresh: clean
	Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue
	npm install

# Testar conexão Neo4j
test-connection:
	node test-neo4j.js

# Verificar porta 3000
check-port:
	netstat -ano | findstr :3000

# Mostrar ajuda
help:
	@echo "Comandos disponíveis:"
	@echo "  make dev        - Iniciar servidor de desenvolvimento"
	@echo "  make build      - Build do projeto"
	@echo "  make start      - Iniciar em produção"
	@echo "  make install    - Instalar dependências"
	@echo "  make clean      - Limpar cache do Next.js"
	@echo "  make fresh      - Limpar tudo e reinstalar"
	@echo "  make test-neo4j - Testar conexão com Neo4j"
	@echo "  make kill-node  - Matar todos os processos Node.js"
	@echo "  make check-port - Verificar se porta 3000 está ocupada"