class ChangePrecisionOnUserBalance < ActiveRecord::Migration
  def change
    change_column :users, :balance, :decimal, precision: 6, scale: 2, default: 0.0
  end
end
