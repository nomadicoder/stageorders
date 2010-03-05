class CreateSupportUnits < ActiveRecord::Migration
  def self.up
    create_table :support_units do |t|
      t.integer :team_id
      t.integer :support_type_id
      t.string :tac_callsign
      t.string :ham_callsign
      t.integer :support_status_code_id
      t.integer :current_stage_id
      t.float :location_lat
      t.float :location_lon

      t.timestamps
    end
  end

  def self.down
    drop_table :support_units
  end
end
