class StaticPagesController < ApplicationController
  layout "sign_in", only: [:sign_in]

  def roster
    TeamSnap.init(:token => session[:token])
    @team = TeamSnap::Team.find(1340251)

    if false
      begin
        TeamSnap.init(:token => session[:token])
        #@team = TeamSnap::Team.find(1344217)
        @team = TeamSnap::Team.find(1340251)
      rescue
        flash[:notice] = nil
        destroy_session
      end
    end
  end
end
