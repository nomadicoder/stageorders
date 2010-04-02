class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
      t.integer :number
      t.string :landmark
      t.decimal :miles, :precision=> 3, :scale=> 1
      t.integer :difficulty
      t.time :estimated_pace
      t.time :estimated_time

      t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
