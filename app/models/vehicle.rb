class Vehicle < ApplicationRecord
    belongs_to :user 
    has_many :vehicle_issues 
    has_many :issues, through: :vehicle_issues 



    
    validates :vehicle_name, :model, :make, :color, :year, :wheel_size, presence: true
    validates :mileage, numericality: {only_integer: true}
    validates :wheel_size, numericality: { less_than_or_equal_to: 30 }
    validates_numericality_of :year, less_than_or_equal_to: Time.now.year + 1

    scope :high_mileage_vehicles, -> {where("mileage >= 100000")}

    def high_mileage_vehicles?
        self.mileage >= 100000 ? true : false
    end

    #associations

    
end

