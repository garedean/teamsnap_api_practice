class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    #redirect_to sign_in_path unless session[:token]
  end

  def destroy_session
    session[:user_id] = nil
    session[:token]   = nil
    redirect_to sign_in_path, confirm: "Your session expired. Please sign in."
  end
end
