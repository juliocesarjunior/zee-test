# Desafio Técnico Zee.Now

API REST para Gerenciamento de Produtos e SKUs.

## Configurando o sistema
Para configurar o sistema no seu computador você precisa do ruby, node e yarn configurado no seu computador.

* Ruby: 3.2.1
* Rails: 7.0.8
* Node.js: 17 (ou superior)

Siga os passos abaixo para configurar o sistema no seu computador.
1. Instale todas as dependências de assets executando o comando: `yarn install` 
2. Instale todas as dependências do Rails (gems) executando o comando: `bundle install`
3. Configure o arquivo database.yml localizado na pasta config com seu usuário e senha do banco de dados.
4. Com o banco de dados configurado, crie os bancos de dados executando:  `rails db:create`
5. Execute as migrações do banco de dados com o comando: `rails db:migrate`
6. Popule o banco de dados com dados iniciais usando: `rails db:seed`
7. Compile os assets para produção com o comando:  `assets:precompile`

# Iniciando o projeto
Agora com tudo configurado, basta executa `rails s`

## API
Para acessar a API, você pode utilizar programas como o Postman, Restfox, Insomnia, entre outros.

### Autenticação:
Endpoint para autenticação:
POST `/api/v1/auth/authenticate`

Exemplo do corpo da solicitação:
```bash
{
  "email": "admin@admin.com",
  "password": "1234567890"
}
```
Após receber o token, adicione-o em `Authorization`  -> `Bearer Token`

### GET Produtos:
Obter todos os produtos:
GET `/produtos`

### POST Produtos:
Criar um novo produto:
POST `/produtos`

Exemplo do corpo da solicitação para criar um produto:
```bash
{
  "name_display": "Dodge Charger",
  "description": "Carro",
  "manufacturer": "Lamborghini",
  "active": true,
  "skus_attributes": [
    {
      "name": "Altis Hybrid 1.8 16V CVT",
      "stock": 5,
      "price_table": "250.000,00",
      "price_listing": "260.000,00"
    }
  ]
}
```

### GET Produto ID:
Obter um produto específico por ID:
GET `/produtos/{id}`

### PACHT Produtos ID:
Atualizar um produto por ID:
PACHT `/produtos/{id}`

Exemplo do corpo da solicitação para atualizar um produto:
```bash
{
    "name_internal": "super-mario",
    "name_display": "Super Mario",
    "description": "Jogos eletrônicos",
    "manufacturer": "Nintendo",
    "active": false,
    "skus_attributes": [
      {
        "id": {id},
        "code": "462771307752",
        "name": "Super Nintendo",
        "stock": 1,
        "price_table": "100,00",
        "price_listing": "200,00"
      }
    ]
  }
```

### DELETA Produto  ID:
Deletar um produto por ID:
DELETE `/produtos/{id}`


## Documentação Swagger
Para acessar a documentação Swagger da API, siga os passos abaixo:
```bash
	http://localhost:3000/api-doc
```

## Testes com RSpec
Para executar os testes automatizados nos modelos, utilize o seguinte comando:
```bash
	bundle exec rspec spec/models
```
Apenas Testes RSpec nos Modelos:
1. Usuarios
2. Produtos
3. SKUs

