class CreateRunners < ActiveRecord::Migration
  def self.up
    create_table :runners do |t|
      t.integer :stage_id
      t.string :name
      t.time :estimated_pace, :default => "00:00"
      t.boolean :completed
      t.time :actual_time, :default => "00:00:00"

      t.timestamps
    end
  end

  def self.down
    drop_table :runners
  end
end
