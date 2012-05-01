class CreateRunnerStatusCodes < ActiveRecord::Migration
  def change
    create_table :runner_status_codes do |t|
      t.float :sequence
      t.string :short_code
      t.text :description

      t.timestamps
    end
  end
end
