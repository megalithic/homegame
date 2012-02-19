# == Schema Information
#
# Table name: votes
#
#  id            :integer         not null, primary key
#  player_id     :integer
#  selected_date :datetime
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Vote < ActiveRecord::Base
  attr_accessible :selected_date, :player_id

  def self.player_voted(player_id, week_number)
    selected_date = Vote.find(:first, :conditions => ["player_id = ? AND strftime('%W', selected_date) = ?", player_id, week_number])
    if !selected_date.nil?
      selected_week_number = selected_date.strftime("%W")
      @voted = (selected_week_number == week_number)
    end
  end
end
