class Vehicle < ApplicationRecord
    belongs_to :user #needs user_id to save to database with belongs_to
    has_many :issues
    

    scope :high_mileage_vehicles, -> {where("mileage > 100000")}

    def high_mileage_vehicles?
        self.mileage > 100000 ? true : false
    end
end

=begin
    <ul>
<% @vehicles.each do |v| %>
<li><%=v.make.capitalize %></li>
<li><%= v.model.capitalize %></li>
<li><%= v.year %></li>
<li><%= v.mileage %></li>
<li><%=v.wheel_size %></li>
<% end %>

</ul>
 Will also need  method that will not save a vehicle if the name, make, and model are the same

    
=end