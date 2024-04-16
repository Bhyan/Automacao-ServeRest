require 'httparty'

class ProductService
    include HTTParty

    def create_product(product)
        self.class.post("#{ENV["BASE_URL"]}/produtos", :body => product, :headers => {"Authorization" => ENV["AUTHORIZATION"]})
    end

    def delete_product(id_product)
        self.class.delete("#{ENV["BASE_URL"]}/produtos/#{id_product}", :headers => {"Authorization" => ENV["AUTHORIZATION"]})
    end

    def get_product(id_product)
        self.class.get("#{ENV["BASE_URL"]}/produtos/#{id_product}")
    end

    def get_all_product
        self.class.get("#{ENV["BASE_URL"]}/produtos")
    end

    def edit_produtc(id_product, product)
        self.class.put("#{ENV["BASE_URL"]}/produtos/#{id_product}", :body => product, :headers => {"Authorization" => ENV["AUTHORIZATION"]})
    end
end