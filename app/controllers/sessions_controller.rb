class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(user_params)
    if @user.nil?
      flash[:alert] = 'User not found!'
      redirect_to new_session_path
    else
      flash[:notice] = 'Logged in successfully.'
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end