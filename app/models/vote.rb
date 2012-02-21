# == Schema Information
#
# Table name: votes
#
#  id            :integer         not null, primary key
#  player_id     :integer
#  selected_date :datetime
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  week_number   :integer
#

class Vote < ActiveRecord::Base
  attr_accessible :selected_date, :player_id, :week_number
  has_many :players

  def self.player_voted(player_id, week_number)
    vote = Vote.first(:conditions => ["player_id = ? AND week_number = ?", player_id, week_number])
    unless vote.nil?
      return vote[:selected_date].strftime("%W") == week_number
    end
  end
end
