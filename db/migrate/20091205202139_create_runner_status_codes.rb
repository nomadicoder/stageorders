class CreateRunnerStatusCodes < ActiveRecord::Migration
  def self.up
    create_table :runner_status_codes do |t|
      t.float :sequence
      t.string :short_code
      t.text :description

      t.timestamps
    end
    
    add_column :runners, :runner_status_code_id, :integer, :default => 1
  end
  def self.down
    remove_column :runners, :runner_status_code_id
    drop_table :runner_status_codes
  end
end
