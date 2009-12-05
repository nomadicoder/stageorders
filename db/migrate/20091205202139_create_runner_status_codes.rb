class CreateRunnerStatusCodes < ActiveRecord::Migration
  def self.up
    create_table :runner_status_codes do |t|
      t.float :sequence
      t.string :short_code
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :runner_status_codes
  end
end
