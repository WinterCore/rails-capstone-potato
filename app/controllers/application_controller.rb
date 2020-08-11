class ApplicationController < ActionController::Base
  helper_method :current_user, :user_logged_in?

  protected

  def current_user
    User.find(session[:user_id])
  end

  def user_logged_in?
    !session[:user_id].nil?
  end

  def authenticate
    redirect_to new_session_path unless user_logged_in?
  end
end
