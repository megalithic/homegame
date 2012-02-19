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

require 'spec_helper'

describe Game do
  pending "add some examples to (or delete) #{__FILE__}"
end
