# language: pt
Funcionalidade: Endpoint POST /usuarios

  @create_user
  Cenário: Cadastro de usuário
    Quando realizo o cadastro de um novo usuário
      | nome          | Bruce Baner       |
      | email         | bruce@avenger.com |
      | password      |            123456 |
      | administrador | true              |
    Então deve retornar o status code 201
    E os dados devem ser percistido no sistema

  @email_duplicated
  Cenário: Email duplicado
    Dado que exista um usuário cadastrado no sistema
      | nome          | Steve Roger       |
      | email         | steve@avenger.com |
      | password      |            123456 |
      | administrador | true              |
    Quando realizo o cadastro de um novo usuário com um email já existente
      | nome          | Steve Roger       |
      | email         | steve@avenger.com |
      | password      |            123456 |
      | administrador | true              |
    Então deve retornar o status code 400
    E deve retornar a mensagem de erro "Este email já está sendo usado"
