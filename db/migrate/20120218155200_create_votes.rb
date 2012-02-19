class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :player_id
      t.datetime :selected_date

      t.timestamps
    end
  end
end
