require 'httparty'
require 'debug'

class CarService
    include HTTParty

    def create_car(id_product)
        self.class.post("#{ENV["BASE_URL"]}/carrinhos", :body => {"produtos": [
            {"idProduto": id_product,"quantidade": 1}
            ]
        }, :headers => {"Authorization" => ENV["AUTHORIZATION"]})
    end

    def get_car(id_car)
        self.class.get("#{ENV["BASE_URL"]}/carrinhos/#{id_car}")
    end

    def delete_car(id_car)
        self.class.delete("#{ENV["BASE_URL"]}/carrinhos/#{id_car}")
    end
end