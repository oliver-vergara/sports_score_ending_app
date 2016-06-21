class ChangePrecisionOnUserBalanceAgain < ActiveRecord::Migration
  def change
    change_column :users, :balance, :decimal, precision: 8, scale: 2, default: 0.00
  end
end
