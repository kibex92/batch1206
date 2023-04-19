# puts "How old are you?"
# age = gets.chomp.to_i

# IF STATEMENT
# if age.even?
#   puts "Your age is even!"
# end

# !IF 
# if !age.odd?
#   puts "Your age is even!"
# end

# UNLESS
# unless age.odd?
#   puts "Your age is even!"
# end

# CAN YOU VOTE?

# puts "How old are you?"
# age = gets.chomp.to_i

# if age >= 18
#   puts "You can vote!"
# else
#   puts "You cannot vote!"
# end

# TERNARY OPERATOR

# puts "What is your guess?"
# guess = gets.chomp.downcase
# coin = ["heads", "tails"].sample

# # result = <condition> ? <true> : <false>
# result = guess == coin ? "Congrats, you won!" : "Sorry, you lost!"

# puts result

# IF/ELSIF/ELSE

# puts "What's the time?"
# hour = gets.chomp.to_i

# if hour < 12
#   puts "Good morning!"
# elsif hour >= 20
#   puts "Good night!"
# elsif hour > 12
#   puts "Good afternoon!"
# else
#   puts "Lunch time!"
# end

# CASE
# puts "What do you want to do? [read|write|exit]"
# action = gets.chomp

# case action
# when "read" 
#   puts "You are in READ mode!"
# when "write"
#   puts "You are in WRITE mode!"
# when "exit"
#   puts "bye bye"
# else
#   puts "wrong action!"
# end


# INLINE CONDITIONAL
# puts "How old are you?"
# age = gets.chomp.to_i

# <Truthy part> <Condition>
# puts "Your age is even!" unless age.odd?
# puts "Your age is even!" if age.even?

# MULTIPLE CONDITIONS

# elegant_dress = true
# on_list = true

# Fancy club
# if elegant_dress && on_list
#   puts "Welcome to our fancy club!"
# end

# Chill club
# if elegant_dress || on_list
#   puts "Welcome to our chill club!"
# end

# puts "What's the time?"
# hour = gets.chomp.to_i

# if (hour >= 9 && hour < 12) || (hour >= 14 && hour <= 18)
#   puts "Open!"
# else
#   puts "Closed!"
# end

# WHILE LOOPING

# price = rand(1..5)
# guess = nil 

# while price != guess
#   puts "What's your guess?"
#   guess = gets.chomp.to_i
# end
# puts "you won!"

# UNTIL
# until price == guess
#   puts "Try again!"
#   guess = gets.chomp.to_i
# end

# LOOP

# loop do
#   puts "hello"
# end
# puts "You won!"

# FOR LOOP
# for num in 1..5
#   puts num * 2
# end
