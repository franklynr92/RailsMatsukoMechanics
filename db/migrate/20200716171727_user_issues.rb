class UserIssue < ActiveRecord::Migration[6.0]
  def change
    create_table :user_issues do |t|
      t.integer :user_id
      t.integer :issue_id
    end
  end
end
