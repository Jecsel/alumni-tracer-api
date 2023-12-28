class UserController < ApplicationController
    # skip_before_action :verify_authenticity_token
    before_action :must_be_authenticated , only:[:index, :update_user, :deactivate_user]

    def index
        users = User.all.where(is_active: true).order('created_at DESC')
        render json: { user:users },status: 200
    end

    def update_user
        user = User.find_by_id update_params[:id]
        if user.present?
            if user.password != update_params[:password]
                user.update( 
                    username: update_params[:username],
                    password: Digest::MD5.hexdigest(update_params[:password])[0..19],
                    user_role_id: update_params[:user_role_id],
                    user_type_id: update_params[:user_type_id],
                    is_active: update_params[:is_active])
                json_response(200, "User Updated")
            else
                user.update( 
                    username: update_params[:username],
                    password: update_params[:password],
                    user_role_id: update_params[:user_role_id],
                    user_type_id: update_params[:user_type_id],
                    is_active: update_params[:is_active])
                json_response(200, "User Updated")
            end
        else
            error_404
        end
    end

    def deactivate_user
        begin
            user = User.find(params[:id])
            p params[:admin_password]
            if @current_user.valid_password?(params[:admin_password])
                user.update(user_type_id: 1, user_role_id: 1, is_active: false)
                json_response(200, "Account successfully deleted.")
            else
                json_response(200, "Invalid admin password.")
            end
        rescue StandardError => e
            p e.to_s
            render json: {
                error: e.to_s
            }, status: 500
        end
    end

    def register
        unless User.exists?(username: register_params[:username])
            user = User.create(username: register_params[:username].downcase, password: register_params[:password], user_role_id: 1, user_type_id: register_params[:user_type_id], is_active: true)

            render json: {message: "Successfully registered.", user: user }, status: 200
        else
            render json: { message: "Username already exists." }, status: 409
        end        
    end

    # def register
    #     unless User.exists?(username: register_params[:username])
    #         user = User.create(username: register_params[:username].downcase, password: register_params[:password], user_role_id: 1, user_type_id: register_params[:user_type_id], is_active: false)

    #         p user
    #         alumni_main = user.build_alumni_main(first_name: register_params[:first_name], middle_name: register_params[:middle_name], last_name: register_params[:last_name], batch_year: register_params[:batch_year])
    #         alumni_main.save

    #         p alumni_main

    #         render json: {message: "Successfully registered.", user: user }, status: 200
    #     else
    #         render json: { error: "Username already exists." }, status: 409
    #     end        
    # end

    private

    def register_params
        params
          .require(:user)
          .permit(
            :username, :password, :confirm_password, :user_type_id, :user_role_id, :is_active
          )
    end

    def user_params
        params.require(:user).permit(:user_id, :user_role_id, :user_type_id, :is_active)
    end

    def update_params
        params.require(:user).permit(:id, :username, :password, :user_token, :user_role_id, :user_type_id, :is_active)
    end
end
