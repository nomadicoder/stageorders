class CreateStageStatusCodes < ActiveRecord::Migration
  def self.up
    create_table :stage_status_codes do |t|
      t.string :short_code
      t.string :description
      t.float :sequence
      t.integer :runner_status_code_id
      t.integer :support_status_code_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stage_status_codes
  end
end
