class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.integer :vehicle_id
      t.string :description_of_issue
      t.boolean :resolved
      t.date :date
      t.string :title
      t.timestamps
    end
  end
end
