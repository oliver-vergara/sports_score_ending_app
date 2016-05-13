class AddStatusColumnToGame < ActiveRecord::Migration
  def change
    add_column :games, :status, :boolean, default: true
  end
end
