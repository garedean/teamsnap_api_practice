class StaticPagesController < ApplicationController
  layout "sign_in", only: [:sign_in]

  def roster
    begin
      TeamSnap.init(:token => session[:token])
      #@team = TeamSnap::Team.find(1344217)
      puts "==============================="
      session[:test] = "test"
      puts sessionn[:test]
      puts TeamSnap::Team.find(1340251)
      puts "==============================="

      @team = TeamSnap::Team.find(1340251)
    rescue
      flash[:notice] = nil
      destroy_session
    end
  end
end
