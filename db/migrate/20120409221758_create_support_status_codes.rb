class CreateSupportStatusCodes < ActiveRecord::Migration
  def change
    create_table :support_status_codes do |t|
      t.float :sequence
      t.string :short_code
      t.text :description

      t.timestamps
    end
  end
end
