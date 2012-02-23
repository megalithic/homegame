module ApplicationHelper
  def game_week_date
    date = Date.current
    date.next_week.beginning_of_week.to_formatted_s(:short_ordinal)
  end

  def current_game_date
    week_number = Date.current.next_week.strftime("%W")
    date = Vote.first(:select => "distinct selected_date", :group => "selected_date", :conditions => ["week_number = ?", week_number], :order => "COUNT(selected_date) DESC", :limit => 1).selected_date
    date.strftime("%A, %b #{date.day.ordinalize}")
  end

  def game_week_options
    date = Date.current
    date.next_week.beginning_of_week..date.next_week.end_of_week
    #TODO: need to format the output options text
  end

  def abbr_full_name(full_name)
    full_name.sub(/(.+\b.).+\z/, '\1.')
  end
end