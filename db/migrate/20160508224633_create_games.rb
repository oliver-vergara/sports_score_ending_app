class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :winning_score
      t.integer :losing_score

      t.timestamps null: true
    end
  end
end
