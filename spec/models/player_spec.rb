# == Schema Information
#
# Table name: players
#
#  id              :integer         not null, primary key
#  username        :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  remember_token  :string(255)
#

require 'spec_helper'

describe Player do
  pending "add some examples to (or delete) #{__FILE__}"
end
