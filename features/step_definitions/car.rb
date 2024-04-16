Quando('realizo o cadastro de um novo carrinho') do
    @car_response = @service.call(CarService).create_car(ENV["ID_PRODUCT"])
end

Então('o código da requisição deve retornar {int}') do |status_code|
    expect(@car_response.code).to eql status_code
end

Então('os dados do carrinho devem percistir no sistema') do
    car = @service.call(CarService).get_car(@car_response.parsed_response["_id"])
    product = @service.call(ProductService).get_product(ENV["ID_PRODUCT"])
    expect(car["produtos"]["idProduto"]).to eql product["_id"]
    expect(car["produtos"]["precoUnitario"]).to eql product["preco"]
    expect(car["precoTotal"]).to eql product["preco"] * car["produtos"]["quantidade"]
end