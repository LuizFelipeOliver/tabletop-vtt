# Tabletop VTT

Mesa virtual de RPG (Tabletop VTT) construída em Go. Permite criar campanhas,
mapas, tokens, rolar dados, conversar em tempo real e gerenciar turnos de combate.

## Pré-requisitos

- Go 1.26+
- PostgreSQL 15+

## Como rodar

```bash
# 1. Configurar banco
export DATABASE_URL="postgres://postgres:postgres@localhost:5432/tabletop_vtt?sslmode=disable"

# 2. Criar o banco
createdb tabletop_vtt

# 3. Instalar dependências
go mod tidy

# 4. Rodar o servidor (as migrations rodam automaticamente)
go run cmd/server/main.go
```

O servidor sobe em `http://localhost:8080`.

## Variáveis de ambiente

| Variável | Default | Descrição |
|---|---|---|
| `DATABASE_URL` | postgres://postgres:postgres@localhost:5432/tabletop_vtt?sslmode=disable | URL do PostgreSQL |
| `JWT_SECRET` | dev-secret-change-me | Secret do JWT |
| `PORT` | 8080 | Porta do servidor |

## Estrutura do projeto

```
tabletop-vtt/
├── cmd/
│   └── server/
│       └── main.go              ← entrada da aplicação
├── internal/
│   ├── database/
│   │   ├── postgres.go          ← conexão + migrations
│   │   └── migrations/          ← SQL migrations (golang-migrate)
│   ├── user/                    ← módulo de usuários
│   │   ├── model.go             ← struct User
│   │   ├── repository.go        ← queries SQL
│   │   ├── service.go           ← lógica de negócio
│   │   └── handler.go           ← HTTP handlers
│   ├── auth/                    ← JWT + middleware
│   ├── campaign/
│   ├── scene/
│   ├── token/
│   ├── roll/
│   ├── chat/
│   └── initiative/
├── go.mod
└── go.sum
```

## Tecnologias

- [Go](https://go.dev/) — linguagem
- [Gin](https://gin-gonic.com/) — HTTP router
- [sqlx](https://jmoiron.github.io/sqlx/) — SQL helper
- [golang-migrate](https://github.com/golang-migrate/migrate) — migrations
- [golang-jwt](https://github.com/golang-jwt/jwt) — autenticação JWT
- [gorilla/websocket](https://github.com/gorilla/websocket) — tempo real
- [PostgreSQL](https://www.postgresql.org/) — banco de dados

## Testes

```bash
go test ./...
```

## Licença

MIT
