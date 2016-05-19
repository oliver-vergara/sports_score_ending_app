class AddBankerIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :banker_id, :integer
  end
end
