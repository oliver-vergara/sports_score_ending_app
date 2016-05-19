class ChangeScheduleDateType < ActiveRecord::Migration
  def change
    change_column :games, :schedule, :string
  end
end
