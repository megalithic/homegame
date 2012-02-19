module ApplicationHelper

  def game_week_date
    current = Date.today.beginning_of_week + 7
    current.strftime("%B #{current.day.ordinalize}")
  end

  def current_game_date
    date = Date.today.beginning_of_week + 7
    date.strftime("%A, %b #{date.day.ordinalize}")
  end

end
