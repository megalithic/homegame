class MainController < ApplicationController
  def index
    @player = Player.new
    @vote = Vote.new
    @votes = Vote.all
  end
end
