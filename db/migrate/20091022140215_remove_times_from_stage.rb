class RemoveTimesFromStage < ActiveRecord::Migration
  def self.up
    remove_column :stages, :estimated_pace
    remove_column :stages, :estimated_time
  end

  def self.down
    add_column :stages, :estimated_time, :time
    add_column :stages, :estimated_pace, :time
  end
end
