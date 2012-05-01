class CreateStageStatuses < ActiveRecord::Migration
  def change
    create_table :stage_statuses do |t|
      t.integer :team_id
      t.integer :stage_id
      t.integer :runner_id
      t.integer :support_unit_id
      t.integer :runner_status_code_id
      t.integer :support_status_code_id
      t.integer :stage_status_code_id

      t.timestamps
    end
  end
end
