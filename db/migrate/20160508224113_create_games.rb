class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :pick

      t.timestamps null: true
    end
  end
end
