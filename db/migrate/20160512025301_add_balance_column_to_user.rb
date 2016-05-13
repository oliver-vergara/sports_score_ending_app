class AddBalanceColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal, precision: 5, scale: 2
  end
end
