class AboutController < ApplicationController
  def index
    @player = Player.new
    @vote = Vote.new
  end
end
