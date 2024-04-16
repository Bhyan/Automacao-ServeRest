# language: pt
Funcionalidade: Endpoint /login

  @login
  Cenário: Realizar login
    Dado que exista um usuário cadastrado no sistema
      | nome          | Stephen Strange     |
      | email         | stephen@avenger.com |
      | password      |              123456 |
      | administrador | true                |
    Quando realizo o login com o usuário
    Então deve retornar a mensagem "Login realizado com sucesso"
    E deve retornar o código de status 200

  @login_invalido
  Cenário: Login invalido
    Quando realizo o login com o usuário não cadastrado no sistema
      | email    | sam@avenger.com |
      | password |          123456 |
    Então deve retornar a mensagem "Email e/ou senha inválidos"
    E deve retornar o código de status 401
