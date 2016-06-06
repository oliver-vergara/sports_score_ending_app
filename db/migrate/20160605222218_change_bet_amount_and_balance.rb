class ChangeBetAmountAndBalance < ActiveRecord::Migration
  def change
    change_column :games, :bet_amount, :decimal, precision: 9, scale:2
    change_column :users, :balance, :decimal, precision: 9, scale:2
  end
end
