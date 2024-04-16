# language: pt
Funcionalidade: Endpoint DELETE /usuarios

  Contexto: 
    Dado que exista um usuário cadastrado no sistema
      | nome          | Wanda Maximoff    |
      | email         | wanda@avenger.com |
      | password      |            123456 |
      | administrador | true              |

  @delete_user
  Cenário: Deleção de usuário
    Quando realizo o delete deste usuário
    Então deve retornar o status code 200
