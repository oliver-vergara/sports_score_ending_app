class AddBetAmountToGames < ActiveRecord::Migration
  def change
    add_column :games, :bet_amount, :decimal, precision: 5, scale: 2
  end
end
