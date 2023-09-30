## Sopha API

### Sobre o Projeto

Este projeto é uma API Rails que permite a criação de usuários e lojas, além de permitir a autenticação de usuários e a atualização de lojas.

### Pré-requisitos

- Ruby 2.7.0
- Rails 5.x
### Setup de Desenvolvimento Docker

Utilizando Docker e Docker Compose:

```sh
cd Sopha-Test-Api
	ARG_USER_UID=$(id -u) ARG_USER_GID=$(id -g) docker compose config
  ARG_USER_UID=$(id -u) ARG_USER_GID=$(id -g) docker compose build
  docker compose up -d
  docker compose exec app bash
    bundle
    rails db:drop db:create db:migrate db:seed
		rspec
    rails s
    # Brower: http://localhost:3000
    # Press: CTRL+C
    exit
  docker compose down
```

### Como Rodar o Projeto

1. Inicie o servidor Rails:

```bash
docker-compose up -d
docker compose exec app bash
  rails s
```

Agora a API deve estar disponível em `http://localhost:3000/`.


### Como Rodar os Testes

1. RSpec para testes de unidade e integração:

    ```bash
    rspec
    ```

2. RSwag para geração da documentação Swagger:

    ```bash
    rake rswag:specs:swaggerize
    ```

### Endpoints Disponíveis

Descrição rápida dos principais endpoints, como:
- `POST /auth` - Cria um novo usuário
- `POST /auth/sign_in` - Autentica um usuário
- `GET /stores` - Retorna todos as lojas 
- `POST /stores` - Cria uma nova loja
- `PUT /stores/:id` - Atualiza uma loja específica
- `DELETE /stores/:id` - Deleta uma loja específica
- `GET /stores/:id/`  - Retorna uma loja específica`

Para detalhes completos, consulte a documentação na coleção exportada do postman \api_postman_collection.json ou pelo endereço https://documenter.getpostman.com/view/30124778/2s9YJaYPyi
