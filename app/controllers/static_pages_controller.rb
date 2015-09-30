class StaticPagesController < ApplicationController
  layout "sign_in", only: [:sign_in]

  def sign_in
    puts "==============================="
    puts session[:test]
    puts session[:token]
    TeamSnap.init(:token => session[:token]) if session[:token]
    #puts TeamSnap::Team.find(1340251)
    puts "==============================="
  end

  def roster
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
