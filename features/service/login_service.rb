require 'httparty'

class LoginService
    include HTTParty

    def login(user)
        self.class.post("#{ENV["BASE_URL"]}/login", :body => {
            "email" => user["email"], 
            "password" => user["password"]
        })
    end
end
