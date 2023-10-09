class AuthController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :must_be_authenticated, only:[:index]

  def index
    @users = User.all
  end

  def sign_in
    @user = User.find_by_username(user_params[:username].downcase)
    if @user.nil?
      render json: { message: "User is not registered!" }, status: 500

    else
      validate_pwd = @user.valid_password?(user_params[:password])

      if validate_pwd
        is_auth, return_val = AuthService.new.login(@user, validate_pwd)
  
        if is_auth
          @token = return_val
          alumni_main = AlumniMain.where(user_id: @user.id).last
          render json: { message: 'Successfully login.', token: @token, user_type_id: @user.user_type_id, user_role_id: @user.user_role_id, alumni_main: alumni_main }, status: 200
        else
          render json: { message: return_val }, status: 500
        end
      else
        render json: { message: "Invalid password." }, status: 500
      end
    end
  end
  
  private 

  def edit_params
    params.require(:user).permit(:id, :username, :user_group_id, :is_active)
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def create_params
    params.require(:user).permit(:username, :password, :user_type_id, :user_role_id)
  end
end
 