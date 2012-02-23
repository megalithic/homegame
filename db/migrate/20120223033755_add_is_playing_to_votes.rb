class AddIsPlayingToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :is_playing, :boolean, :default => true

  end
end
