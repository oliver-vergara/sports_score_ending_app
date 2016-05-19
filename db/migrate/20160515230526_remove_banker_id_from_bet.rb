class RemoveBankerIdFromBet < ActiveRecord::Migration
  def change
    remove_column :bets, :banker_id, :integer
  end
end
