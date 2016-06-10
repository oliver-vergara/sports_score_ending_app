class AddIndexingToDatabase < ActiveRecord::Migration
  def change
    add_index :bets, :better_id
    add_index :bets, :combo_id
    add_index :bets, :game_id
    add_index :combos, :pick
    add_index :games, :banker_id
    add_index :games, :winning_score
    add_index :games, :losing_score

  end
end
