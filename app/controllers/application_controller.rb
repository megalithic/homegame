class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_player, :player_signed_in?, :player_signed_out?, :player_voted?, :enough_votes?, :current_vote_count, :player_by_id, :is_playing?

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
    week_number = Date.current.next_week.strftime("%W")
    Vote.player_voted(current_player.id, week_number) unless current_player.nil?
  end

  def is_playing?
    week_number = Date.current.next_week.strftime("%W")
    Vote.player_playing(current_player.id, week_number) unless current_player.nil?
  end

  def enough_votes?
    current_vote_count >= 6
  end

  def current_vote_count
    date = Date.current.next_week.strftime("%W")
    votes_for_week = Vote.all(:conditions => ["week_number = ? AND is_playing = true", date]) unless date.nil?
    votes_for_week.count
  end

  def player_by_id(player_id)
    player = Player.find(player_id) unless player_id.nil?
  end
end