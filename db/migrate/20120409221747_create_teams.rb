class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :number
      t.string :name
      t.string :short_name
      t.datetime :start_time

      t.timestamps
    end
  end
end
