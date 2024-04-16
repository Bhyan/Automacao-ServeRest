class Utils
    def delete_all_users
        users = UserService.new.get_all_user.parsed_response["usuarios"]
        users_filter = users.select{|user|
            user["email"] == "stephen@avenger.com" ||
            user["email"] == "sam@avenger.com" ||
            user["email"] == "tony@stark.com" ||
            user["email"] == "peter@stark.com" ||
            user["email"] == "bruce@avenger.com" ||
            user["email"] == "steve@avenger.com" ||
            user["email"] == "wanda@avenger.com" ||
            user["email"] == "wade@xmen.com"
        }
    
        users_filter.each do |user|
            UserService.new.delete_user(user["_id"])
        end
    end

    def delete_all_products
        products = ProductService.new.get_all_product.parsed_response["produtos"]
        user = {"email" => "wade@xmen.com", "password" => "123456"}
        ENV["AUTHORIZATION"] = LoginService.new.login(user)["authorization"]

        product_filter = products.select{|product|
            product["nome"] == "Escudo capitão america" ||
            product["nome"] == "Joia da mente" ||
            product["nome"] == "Cadeira do Professor Xavier" ||
            product["nome"] == "Óculos do Ciclope" ||
            product["nome"] == "Garras do Wolverine"
        }

        product_filter.each do |product|
            ProductService.new.delete_product(product["_id"])
        end
    end
end