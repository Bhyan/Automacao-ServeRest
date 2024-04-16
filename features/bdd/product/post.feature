# language: pt
Funcionalidade: Endpoint POST /produtos

  Contexto: 
    Dado que exista um usuário cadastrado no sistema
      | nome          | Wade Wilson   |
      | email         | wade@xmen.com |
      | password      |        123456 |
      | administrador | true          |

  @creat_product
  Cenário: Cadastra produto
    Quando realizo o cadastro de um novo produto
      | nome       | Escudo capitão america |
      | preco      |                    100 |
      | descricao  | Produto usado          |
      | quantidade |                      1 |
    Então deve retornar o código 201
    E os dados devem percistir no sistema

  @product_duplicated
  Cenário: Produto duplicado
    Dado que exista um produto cadastrado no sistema
      | nome       | Joia da mente |
      | preco      |           100 |
      | descricao  | Produto unico |
      | quantidade |             1 |
    Quando realizo o cadastro de um novo produto com o nome já existente
      | nome       | Joia da mente |
      | preco      |           100 |
      | descricao  | Produto unico |
      | quantidade |             1 |
    Então deve retornar o código 400
    E retornar a mensagem de erro "Já existe produto com esse nome"
