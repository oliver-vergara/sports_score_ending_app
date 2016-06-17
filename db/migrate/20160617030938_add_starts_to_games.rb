class AddStartsToGames < ActiveRecord::Migration
  def change
    add_column :games, :starts, :time
  end
end
