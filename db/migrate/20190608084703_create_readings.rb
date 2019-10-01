class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.timestamps
      t.references :thermostat, foreign_key: true
      t.integer :tracking_number
      t.float :temperature
      t.float :humidity
      t.float :battery_charge
    end
    
    add_index :readings, [:tracking_number, :thermostat_id], unique: true
  end
end
