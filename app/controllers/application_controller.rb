class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_player, :player_signed_in?, :player_signed_out?, :player_voted?, :votes

  def current_player
    @current_player ||= Player.find(session[:player_id]) if session[:player_id]
  end

  def player_signed_in?
    !!current_player
  end

  def player_signed_out?
    !player_signed_in?
  end

  def player_voted?
    date = Date.today
    @player_voted = Vote.player_voted(@current_player.id, date.strftime("%W")) unless @current_player.nil?
  end

  def enough_votes?
    date = Date.today.beginning_of_week + 7
    game = Game.find_by_week_number(date.strftime("%W"))
    votes_for_week_number = Vote.p
  end
end