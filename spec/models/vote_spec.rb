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

require 'spec_helper'

describe Vote do
  pending "add some examples to (or delete) #{__FILE__}"
end
