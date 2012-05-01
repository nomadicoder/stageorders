class CreateRunners < ActiveRecord::Migration
  def change
    create_table :runners do |t|
      t.integer :stage_id
      t.integer :team_id
      t.integer :runner_status_code_id
      t.string :name
      t.time :estimated_pace
      t.boolean :completed
      t.time :actual_time

      t.timestamps
    end
  end
end
