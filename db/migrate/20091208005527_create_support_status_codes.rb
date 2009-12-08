class CreateSupportStatusCodes < ActiveRecord::Migration
  def self.up
    create_table :support_status_codes do |t|
      t.float :sequence
      t.string :short_code
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :support_status_codes
  end
end
