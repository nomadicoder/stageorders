class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :number
      t.string :landmark
      t.float :miles
      t.integer :difficulty

      t.timestamps
    end
  end
end
