# language: pt
Funcionalidade: Endpoint PUT /usuarios

  Contexto: 
    Dado que exista um usuário cadastrado no sistema
      | nome          | Tony Stark     |
      | email         | tony@stark.com |
      | password      |         123456 |
      | administrador | true           |

  @edit_user
  Cenário: Edição de usuário
    Quando realizo a edição deste usuário
      | nome          | Peter Park      |
      | email         | peter@stark.com |
      | password      |          654321 |
      | administrador | false           |
    Então os dados devem ser percistido no sistema
    E deve retornar o status code 200