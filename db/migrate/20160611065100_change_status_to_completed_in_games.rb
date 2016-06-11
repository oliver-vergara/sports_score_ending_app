class ChangeStatusToCompletedInGames < ActiveRecord::Migration
  def change
    rename_column :games, :status, :completed
  end
end
