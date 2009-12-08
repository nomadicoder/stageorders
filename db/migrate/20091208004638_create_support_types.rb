class CreateSupportTypes < ActiveRecord::Migration
  def self.up
    create_table :support_types do |t|
      t.string :short_code
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :support_types
  end
end
