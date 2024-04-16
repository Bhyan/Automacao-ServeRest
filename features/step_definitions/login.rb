Quando('realizo o login com o usuário') do
    user = @service.call(UserService).get_user(ENV["ID_USER"])
    @user_login = @service.call(LoginService).login(user)
    ENV["AUTHORIZATION"] = @user_login["authorization"]
end

Então('deve retornar a mensagem {string}') do |menssagem|
    expect(@user_login["message"]).to eql menssagem
end

Então('deve retornar o código de status {int}') do |status_code|
    expect(@user_login.code).to eq(status_code)
end

Quando('realizo o login com o usuário não cadastrado no sistema') do |user_table|
    @user_login = @service.call(LoginService).login(user_table.rows_hash)
end