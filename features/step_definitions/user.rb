Quando('realizo o cadastro de um novo usuário') do |user_table|
    @data_user = user_table.rows_hash
    @user_response = @service.call(UserService).create_user(@data_user)
    ENV["ID_USER"] = @user_response.parsed_response["_id"]
end

Dado('que exista um usuário cadastrado no sistema') do |user_table|
    @user_response = @service.call(UserService).create_user(user_table.rows_hash)
    ENV["ID_USER"] = @user_response.parsed_response["_id"]
end
  
Então('deve retornar o status code {int}') do |status_code|
    expect(@user_response.code).to eq(status_code)
end

Então('os dados devem ser percistido no sistema') do
    user = @service.call(UserService).get_user(ENV["ID_USER"])
    expect(user["nome"]).to eql @data_user["nome"]
    expect(user["email"]).to eql @data_user["email"]
    expect(user["password"]).to eql @data_user["password"]
    expect(user["administrador"]).to eql @data_user["administrador"]
end

Quando('realizo o delete deste usuário') do
    @user_response = @service.call(UserService).delete_user(@user_response.to_hash["_id"])
end

Quando('realizo a edição deste usuário') do |user_table|
    @data_user = user_table.rows_hash
    @user_response = @service.call(UserService).edit_user(@user_response.to_hash["_id"], @data_user)
end

Quando('realizo o cadastro de um novo usuário com um email já existente') do |user_table|
    @user_response = @service.call(UserService).create_user(user_table.rows_hash)
end

Então('deve retornar a mensagem de erro {string}') do |message|
    expect(@user_response["message"]).to eql message
end