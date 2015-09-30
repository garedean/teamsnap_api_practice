class SessionsController < ApplicationController
  def create
    user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.create_with_omniauth(auth_hash)
    session[:user_id] = user.id
    session[:token]   = auth_token
    redirect_to root_path, notice: "Welcome, #{current_user.email}!"
  end

  def destroy
    session[:user_id] = nil
    session[:token]   = nil
    redirect_to sign_in_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def auth_token
    auth_hash["credentials"]["token"]
  end

  def set_session_token
    session[:token]   = auth_token
  end
end
