require 'faker'

10.times do 
  restaurant = Restaurant.new(
    name: Faker::Games::Pokemon.name,
    city: Faker::Music::Hiphop.groups
  )
  restaurant.save
end
puts "Done"