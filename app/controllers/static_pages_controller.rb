require 'TeamSnap'

class StaticPagesController < ApplicationController
  layout "sign_in", only: [:sign_in]

  def roster
    begin
      TeamSnap.init(:token => session[:token])
      #@team = TeamSnap::Team.find(1344217)
      @team = TeamSnap::Team.find(1340251)
    rescue
      binding.pry
      destroy_session
    end
  end
end
