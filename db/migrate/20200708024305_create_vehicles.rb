class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.integer :wheel_size
      t.integer :user_id
      t.string :vehicle_name
      t.string :color
      t.timestamps
    end
  end
end
