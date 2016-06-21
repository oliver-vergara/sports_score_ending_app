class ChangeDateTime < ActiveRecord::Migration
  def change
    remove_column :games, :starts, :time 
    rename_column :games, :schedule, :start_time
    change_column :games, :start_time, 'timestamp USING CAST(start_time AS timestamp)'
  end
end
