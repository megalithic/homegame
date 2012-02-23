class MainController < ApplicationController
  def index
    @player = Player.new
    @vote = Vote.new
    @current_player_vote = Vote.first(:conditions => ["player_id = ? AND week_number = ? AND is_playing = true", session[:player_id], upcoming_week_number])
    @votes = Vote.all
  end

  def upcoming_week_number
    week_number = Date.current.next_week.strftime("%W")
  end
end
