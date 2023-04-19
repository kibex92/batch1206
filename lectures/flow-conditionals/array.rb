food = ["pizza", "pasta", "lasagne", "sushi", "curry", "cevapi"] # Desetka, for the cevapi place :)
# INDEX:  0         1         2         3         4         5

# CRUD operations!

# READ
# p food
# p food[0] # => Pizza
# p food[-1] # -> Last item

# Modify an element - UPDATE

# p food[1] = "Rice"
# p food

# Add an element - CREATE
# p food << "Chicken"
# p food
# food.push("Chicken")
# Remove an element - DELETE

# food.delete("sushi")
# food.delete_at(0)

# food.each do |item|
#   # item is one element in the array, naming is up to you.
#   puts "#{item} is nice"
# end

# food.each { |item| puts "#{item} is nice" }

p food.join(" ")
