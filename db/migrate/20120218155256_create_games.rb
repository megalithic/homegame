class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :vote_id
      t.datetime :game_date
      t.integer :week_number

      t.timestamps
    end
  end
end
