class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.date :date
      t.string :name_of_your_issue
      t.timestamps
    end
  end
end
