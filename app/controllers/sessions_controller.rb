class SessionsController < ApplicationController
  def new
		# @player = Player.new(params[:player])
  end

  def create
	  player = Player.find_by_username(params[:session][:username])
	  if player && player.authenticate(params[:session][:password])
			session[:player_id] = player.id

	    # if params[:remember_me]
	    #   cookies.permanent[:auth_token] = player.auth_token
	    # else
	    #   cookies[:auth_token] = player.auth_token
	    # end

	    redirect_to root_url, :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid username or password combo.. Pai Gow!"
	    render :partial => "common/login"
	  end
	end

  def destroy
		session[:player_id] = nil
    # cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end