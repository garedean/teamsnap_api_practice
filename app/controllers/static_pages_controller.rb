class StaticPagesController < ApplicationController
  layout "sign_in", only: [:sign_in]

  def roster
    puts "****************************************"

    puts "Auth token: #{session[:token]}"
    puts "User id: #{session[:user_id]}"
    puts TeamSnap.init(:token => session[:token])
    puts "****************************************"

    begin
      TeamSnap.init(:token => session[:token])
      puts "Team: #{TeamSnap::Team.find(1340251)}"
      #@team = TeamSnap::Team.find(1344217)
      @team = TeamSnap::Team.find(1340251)
    rescue
      flash[:notice] = nil
      destroy_session
    end
  end
end
