class AuthService < ApplicationController
    include AbstractController::Rendering

    def initialize
        self
    end

    def login(user, validate_pwd)
        begin
            unless user.is_active
                return false, "User was deactivated!"
            else
                if validate_pwd

                    user_token = Generator.new().generate_alpha_numeric
                    user.update(user_token: user_token)
                    user.save!
                    @bearer_token = encode({user_id: user.id, secret: user_token})
                    
                    return true, @bearer_token
                else
                    return false, "Invalid Password!"
                end
            end
        rescue => exception
            p exception.to_s
            return false, "Server Error! Please contact your administrator!"
        end
    end

    def valid_password?(pass, current_pass)
        p "============="
        p pass
        p "============="
        p current_pass

        return pass === current_pass
    end
end
