class SessionsController < ApplicationController
  def new
    # @player = Player.new(params[:player])
  end

  def create
    player = Player.find_by_username(params[:session][:username])
    if player.nil?
      flash.now.alert = "You need to register first"
      redirect_to root_url, :alert => "You need to register first"
    elsif player && player.authenticate(params[:session][:password])
      session[:player_id] = player.id

      # if params[:remember_me]
      #   cookies.permanent[:auth_token] = player.auth_token
      # else
      #   cookies[:auth_token] = player.auth_token
      # end

      redirect_to root_url, :notice => "You're now logged in"
    else
      flash.now.alert = "Invalid username or password combo.. Pai Gow!"
      redirect_to root_url, :error => "Invalid username or password combo.. Pai Gow!"
    end
  end

  def destroy
    session[:player_id] = nil
    # cookies.delete(:auth_token)
    redirect_to root_url, :error => "You're now logged out"
  end
end