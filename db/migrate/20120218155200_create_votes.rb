class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :player_id
      t.datetime :selected_date
      t.integer :week_number
      t.boolean :is_playing, :default => false

      t.timestamps
    end
  end
end
