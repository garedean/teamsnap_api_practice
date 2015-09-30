require 'httparty'
class SessionsController < ApplicationController
  def create
    user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.create_with_omniauth(auth_hash)

    session[:user_id] = user.id
    session[:token]   = auth_token

    token = auth_token
    auth  = "Bearer " + token
    response = HTTParty.get('https://api.teamsnap.com/v3/me', :headers => { "Authorization" => auth} )
    parsed_response = JSON.parse(response.body)

    user_id = parsed_response["collection"]["items"].first["data"].first["value"]

    response2 = HTTParty.get("https://api.teamsnap.com/v3/teams/search?user_id=#{user_id}", :headers => { "Authorization" => auth} )

    parsed_response2 = JSON.parse(response2.body)
    session[:site_id] = parsed_response2["collection"]["items"].first["data"].first["value"]

    redirect_to roster_path
  end

  def destroy
    destroy_session
    flash[:notice] = nil
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

  def get_client_id

  end
end
