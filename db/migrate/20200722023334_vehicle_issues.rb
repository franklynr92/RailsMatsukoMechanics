class VehicleIssues < ActiveRecord::Migration[6.0]
  def change do|t|
    t.integer :user_id
    t.integer :issue_id
    t.boolean :resolved
    t.string :description_of_issue
  end
  end
end
