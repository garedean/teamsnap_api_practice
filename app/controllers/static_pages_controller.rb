require 'teamsnap'

class StaticPagesController < ApplicationController
  layout "sign_in", only: [:sign_in]

  def roster
    begin
      TeamSnap.init(:token => session[:token])
      @team = TeamSnap::Team.find(session[:site_id])
    rescue
      flash[:notice] = "Something prevented signing in. Please clear your cookies and try again."
      destroy_session
    end
  end
end
