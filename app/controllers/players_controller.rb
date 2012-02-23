class PlayersController < ApplicationController
	def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])
    if @player.save
      session[:player_id] = @player.id
      redirect_to root_url, :notice => "You're now registered and logged in"
    else
      redirect_to register_path, :notice => "There was a problem getting you register, please give it another go"
    end
  end
end