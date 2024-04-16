Quando('realizo o cadastro de um novo produto') do |product_table|
    steps %{
        Quando realizo o login com o usuário
    }
    @data_product = product_table.rows_hash
    @product_response = @service.call(ProductService).create_product(@data_product)
    ENV["ID_PRODUCT"] = @product_response.parsed_response["_id"]
end

Então('deve retornar o código {int}') do |status_code|
    expect(@product_response.code).to eq(status_code)
end

Então('os dados devem percistir no sistema') do
    product = @service.call(ProductService).get_product(ENV["ID_PRODUCT"])
    expect(product["nome"]).to eql @data_product["nome"]
    expect(product["preco"]).to eql @data_product["preco"].to_i
    expect(product["descricao"]).to eql @data_product["descricao"]
    expect(product["quantidade"]).to eql @data_product["quantidade"].to_i
end

Dado('que exista um produto cadastrado no sistema') do |product_table|
    steps %{
        Quando realizo o login com o usuário
    }
    @service.call(ProductService).create_product(product_table.rows_hash)
end

Quando('realizo o cadastro de um novo produto com o nome já existente') do |product_table|
    @product_response = @service.call(ProductService).create_product(product_table.rows_hash)
end

Então('retornar a mensagem de erro {string}') do |message|
    expect(@product_response["message"]).to eql message
end

Quando('realizo o delete deste produto') do
    @product_response = @service.call(ProductService).delete_product(ENV["ID_PRODUCT"])
end

Quando('realizo a edição deste produto') do |product_table|
    @data_product = product_table.rows_hash
    @product_response = @service.call(ProductService).edit_produtc(
        ENV["ID_PRODUCT"], @data_product
    )
end