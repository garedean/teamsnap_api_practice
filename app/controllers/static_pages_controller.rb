require 'TeamSnap'

class StaticPagesController < ApplicationController
  layout "sign_in", only: [:sign_in]

  def roster
    require_login
    if session[:token]
      TeamSnap.init(:token => session[:token])
      @team = TeamSnap::Team.find(1344217)
    end
  end
end
