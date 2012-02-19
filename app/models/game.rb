# == Schema Information
#
# Table name: games
#
#  id          :integer         not null, primary key
#  vote_id     :integer
#  game_date   :datetime
#  week_number :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Game < ActiveRecord::Base
  attr_accessible :week_number, :game_date
end
