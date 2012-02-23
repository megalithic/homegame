class ChangeIsPlayingDefaultToFalse < ActiveRecord::Migration
  def up
    change_column_default(:votes, :is_playing, false)
  end

  def down
    change_column_default(:votes, :is_playing, true)
  end
end
