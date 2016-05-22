class AddWinningComboToGame < ActiveRecord::Migration
  def change
    add_column :games, :winning_
  end
end
