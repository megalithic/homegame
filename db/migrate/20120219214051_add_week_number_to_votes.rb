class AddWeekNumberToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :week_number, :integer
    remove_column :votes, :week_number, :integer
  end
end
