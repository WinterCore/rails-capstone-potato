class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # This is done to make the login case insensitive
    @user = User.where('lower(username) = ?', user_params[:username].downcase).first
    if @user.nil?
      flash[:alert] = 'User not found!'
      redirect_to new_session_path
    else
      flash[:notice] = 'Logged in successfully.'
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Logged out successfully.'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
