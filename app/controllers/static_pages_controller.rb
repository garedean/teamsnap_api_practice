require 'TeamSnap'

class StaticPagesController < ApplicationController
  layout "sign_in", only: [:sign_in]

  def roster
    require_login
    begin
      TeamSnap.init(:token => session[:token])
      @team = TeamSnap::Team.find(1344217)
    rescue
      destroy_session
      redirect_to sign_in_path, confirm: "Your session expired. Please sign in."
    end
  end
end
