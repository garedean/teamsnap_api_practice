require 'httparty'
class SessionsController < ApplicationController
  def create
    user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.create_with_omniauth(auth_hash)

    session[:user_id] = user.id
    session[:token]   = auth_token
    session[:site_id] ||= get_site_id(get_user_id)

    redirect_to roster_path, notice: "Beep bop, boop. System ready."
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
    session[:token] = auth_token
  end

  def get_user_id
    user_data = HTTParty.get('https://api.teamsnap.com/v3/me', :headers => { "Authorization" => "Bearer " + auth_token })

    JSON.parse(user_data.body)["collection"]["items"].first["data"].first["value"]
  end

  def get_site_id(user_id)
    team_data = HTTParty.get("https://api.teamsnap.com/v3/teams/search?user_id=#{user_id}", :headers => { "Authorization" => "Bearer " + auth_token} )

    JSON.parse(team_data.body)["collection"]["items"].first["data"].first["value"]
  end
end
