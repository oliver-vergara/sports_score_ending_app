class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :banker_id
      t.integer :better_id
      t.integer :game_id
      t.integer :combo_id

      t.timestamps null: true
    end
  end
end
