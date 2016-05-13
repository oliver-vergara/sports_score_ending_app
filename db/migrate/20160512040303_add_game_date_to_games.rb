class AddGameDateToGames < ActiveRecord::Migration
  def change
    add_column :games, :schedule, :datetime
  end
end
