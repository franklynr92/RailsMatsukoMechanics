class CreateMechanics < ActiveRecord::Migration[6.0]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.string :mechanic_name
      t.string :password_digest
      t.string :email
      t.boolean :admin, default: false 
     
      t.timestamps 
    end
  end
end
