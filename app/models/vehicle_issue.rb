class VehicleIssue < ApplicationRecord
    belongs_to :issue
    belongs_to :vehicle
    
    validates :description_of_issue, presence: true



    #form with a user submittable attribute
    #access data through associated objects
end


=begin
create_table "issues", force: :cascade do |t|
    #t.integer "vehicle_id"
    #t.string "description_of_issue"
    
    #category: electrical, oil change, tires, steering, mechanical, egnines

    t.date "date"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_issues", force: :cascade do |t|
    t.integer "user_id"
    t.integer "issue_id"
    t.boolean "resolved"
    t.string "description_of_issue"

    #t.integer vehicle_id
    #grabs user id and issue id where user submits description
  end



=end