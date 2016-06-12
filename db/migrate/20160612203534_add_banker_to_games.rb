class AddBankerToGames < ActiveRecord::Migration
  def change
    add_column :games, :banker, :string
  end
end
