class AddWeekNumberToVote < ActiveRecord::Migration
  def change
    add_column :votes, :week_number, :integer

  end
end
