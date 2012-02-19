class PlayersController < ApplicationController
	def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to root_url, :notice => "You're now registered, please log in below"
    else
      render :partial => "common/register"
    end
  end
end