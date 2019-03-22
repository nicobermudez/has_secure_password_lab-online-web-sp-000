class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end


  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
