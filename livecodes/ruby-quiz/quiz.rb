grades = [19, 8, 11, 15, 13]

# Get the sum of all numbers and divide by number of grades

# total = 0
grades.each do |grade|
  total = 0
  total += grade # => 19,8,11...
end


# grades.sum
# num_of_grades = grades.size
# p total.to_f / num_of_grades
# p total.fdiv(num_of_grades)

def capitalize(first_name, last_name)
  "#{first_name.capitalize} #{last_name.capitalize}"
end

# p capitalize("RaHUL", "salotra")

fruits = ["banana", "peach", "watermelon", "orange"]

# Print out "peach" from the fruits array in the terminal
# p fruits[1]
# Add an "apple" to the fruits array

fruits << "apple"


# Replace "watermelon" by "pear"

# fruits[2] = "pear"
# p fruits
# # Delete "orange"
# fruits.delete_at(3)
# p fruits

city = { name: "Paris", population: 2000000 }

# Print out the name of the city
p city[:name]
# Add the Eiffel Tower to city with the `:monument` key

city[:monument] = "Eiffel Tower"
# Update the population to 2000001

city[:population] += 1
# What will the following code return?
city[:mayor] # => nil

# Use the map iterator to convert the variable students, an array of arrays, into an array of hashes.Those hashes should have two keys: :name and :age. What is the type of those keys?
students = [ [ "john", 28 ], [ "mary", 25 ], [ "paul", 21 ] ]

students_hash = students.map do |name, age| 
  # student => [ "john", 28 ]
  {name: name, age: age}
end
p students_hash
# {
#  name: "John",
#  age: 28
# }