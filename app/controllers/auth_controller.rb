class AuthController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :must_be_authenticated, only:[:index]

  def index
    @users = User.all
  end

  def sign_in
    begin
      @user = User.find_by_username(user_params[:username].downcase)
      p "==== check1 ======="
      if @user.nil?
        render json: { message: "User is not registered!" }, status: 500
        p "==== check2 ======="
      else
        validate_pwd = @user.valid_password?(user_params[:password])
        p "==== check3 ======="
        if validate_pwd
          is_auth, return_val = AuthService.new.login(@user, validate_pwd)
          p "==== check4 ======="
          if is_auth
            p "==== check4 ======="
            @token = return_val
            p "==== check5 ======="
            alumni_main = AlumniMain.where(user_id: @user.id).last
            p "==== check6 ======="
            render json: { message: 'Successfully login.', token: @token, user_type_id: @user.user_type_id, user_role_id: @user.user_role_id, user_id: @user.id, alumni_main: alumni_main }, status: 200
          else
            p "==== error1 ======="
            render json: { message: return_val }, status: 500
          end
        else
          p "==== erro2 ======="
          render json: { message: "Invalid password." }, status: 500
        end
      end
    rescue => exception
      p exception
    end

  end

  def forgot_password
    begin
      @user = User.find_by_username(user_params[:username].downcase)
      if @user.nil?
        render json: { message: "User is not registered!" }, status: 500
      else
        @user.update(password: Digest::MD5.hexdigest(user_params[:password])[0..19])

        render json: { message: "Password successfull updated!"}, status: 200
      end
    rescue => exception
      p exception
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
 