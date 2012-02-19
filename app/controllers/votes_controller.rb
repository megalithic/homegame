class VotesController < ApplicationController
  def index
    @player = Player.new
    @vote = Vote.new
  end
end
