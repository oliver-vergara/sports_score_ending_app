class AddDefaultValueToScores < ActiveRecord::Migration
  def change
    change_column :games, :winning_score, :integer, default: 0
    change_column :games, :losing_score, :integer, default: 0
  end
end
