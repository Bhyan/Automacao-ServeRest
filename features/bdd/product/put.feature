# language: pt
Funcionalidade: Endpoint PUT /produtos

  Contexto: 
    Dado que exista um usuário cadastrado no sistema
      | nome          | Wade Wilson   |
      | email         | wade@xmen.com |
      | password      |        123456 |
      | administrador | true          |
    E realizo o cadastro de um novo produto
      | nome       | Óculos do Ciclope |
      | preco      |               100 |
      | descricao  | Produto usado     |
      | quantidade |                 1 |

  @edit_product
  Cenário: Edição de produto
    Quando realizo a edição deste produto
      | nome       | Garras do Wolverine |
      | preco      |                 100 |
      | descricao  | Produto usado       |
      | quantidade |                   1 |
    Então os dados devem percistir no sistema
    E deve retornar o código 200
