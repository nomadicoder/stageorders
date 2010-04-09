class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.integer :number
      t.string :name
      t.string :short_name
      t.datetime :start_time

      t.timestamps
    end
    
    add_column :runners, :team_id, :integer, :default => 0
  end

  def self.down
    drop_table :teams
  end
end
