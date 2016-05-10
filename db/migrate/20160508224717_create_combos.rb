class CreateCombos < ActiveRecord::Migration
  def change
    create_table :combos do |t|
      t.string :pick

      t.timestamps null: true
    end
  end
end
