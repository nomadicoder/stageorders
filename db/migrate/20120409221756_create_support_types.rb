class CreateSupportTypes < ActiveRecord::Migration
  def change
    create_table :support_types do |t|
      t.string :short_code
      t.text :description

      t.timestamps
    end
  end
end
