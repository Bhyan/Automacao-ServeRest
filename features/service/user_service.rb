require 'httparty'

class UserService
    include HTTParty

    def create_user(user)
        self.class.post("#{ENV["BASE_URL"]}/usuarios", :body => user)
    end

    def delete_user(id_user)
        self.class.delete("#{ENV["BASE_URL"]}/usuarios/#{id_user}")
    end

    def edit_user(id_user, user)
        self.class.put("#{ENV["BASE_URL"]}/usuarios/#{id_user}", :body => user)
    end

    def get_user(id_user)
        self.class.get("#{ENV["BASE_URL"]}/usuarios/#{id_user}")
    end

    def get_all_user
        self.class.get("#{ENV["BASE_URL"]}/usuarios")
    end
end