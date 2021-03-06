class AddDefaultValueToUserBalance < ActiveRecord::Migration
  def change
    change_column :users, :balance, :decimal, precision: 5, scale: 2, default: 0
  end
end
