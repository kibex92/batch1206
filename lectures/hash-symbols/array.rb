students =     [ "Peter", "Mary", "Lucas", "George", "Emma" ]
student_ages = [ 24     , 25    , 22      ,  20    ]

students_age = {
  "Peter" => 24,
  "Mary" => 25,
  "George" => 22,
  "Emma" => 20
}

# Peter is 24 years old, Mary is 25 years old etc.

students.each_with_index do |student, index|
  age = student_ages[index]
  puts "#{student} is #{age} years old."
end

# CRUD with Arrays Recap

# READ
students =     [ "Peter", "Mary", "Lucas", "George", "Emma" ]
p students[3] # => George

# CREATE
students << "Mateo"

# UPDATE
students[1] = "Alex"

# DELETE
students.delete("Peter")
students.delete_at(1)