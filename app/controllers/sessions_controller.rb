class SessionsController < ApplicationController
  def create
    puts "**************************"
    puts "Auth hash: #{auth_hash}"
    user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.create_with_omniauth(auth_hash)
    session[:user_id] = user.id
    puts "User id: #{user.id}"
    session[:test]    = "test"
    session[:token]   = auth_token
    puts "Auth token: #{auth_token}"
    
    puts "**************************"
    redirect_to roster_path, notice: "Beep bop, boop. System ready."
  end

  def destroy
    destroy_session
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
