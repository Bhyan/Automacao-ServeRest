# language: pt
Funcionalidade: Endpoint POST /canrinhos

  Contexto: 
    Dado que exista um usuário cadastrado no sistema
      | nome          | Wade Wilson   |
      | email         | wade@xmen.com |
      | password      |        123456 |
      | administrador | true          |
    E realizo o cadastro de um novo produto
      | nome       | Escudo capitão america |
      | preco      |                    100 |
      | descricao  | Produto usado          |
      | quantidade |                      1 |

  @creat_car
  Cenário: Cadastra carrinho
    Quando realizo o cadastro de um novo carrinho
    Então o código da requisição deve retornar 201
    E os dados do carrinho devem percistir no sistema
