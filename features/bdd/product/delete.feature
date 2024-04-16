# language: pt
Funcionalidade: Endpoint DELETE /produtos

  Contexto: 
    Dado que exista um usuário cadastrado no sistema
      | nome          | Wade Wilson   |
      | email         | wade@xmen.com |
      | password      |        123456 |
      | administrador | true          |
    E realizo o cadastro de um novo produto
      | nome       | Cadeira do Professor Xavier |
      | preco      |                         100 |
      | descricao  | Produto usado               |
      | quantidade |                           1 |

  @delete_product
  Cenário: Deleção de produto
    Quando realizo o delete deste produto
    Então deve retornar o código 200
