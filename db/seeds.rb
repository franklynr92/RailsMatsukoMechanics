# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "john", email: "jon123@gmail.com", user_name: "jon123", password_digest: "123")
Issue.create(date: 20/7/20, name_of_issue: "Leaks", category: "oil")
Vehicle.create(make: "ford", model: "focus", year: 2010, mileage: 160000, wheel_size: 16, user_id: 1, vehicle_name: "strong_man", color: "white")
Vehicle.create(make: "ford", model: "f-50", year: 2010, mileage: 165000, wheel_size: 22, user_id: 1, vehicle_name: "the trucker", color: "blue")
Vehicle.create(make: "ford", model: "bronco", year: 2010, mileage: 155000, wheel_size: 20, user_id: 1, vehicle_name: "forester", color: "orange")