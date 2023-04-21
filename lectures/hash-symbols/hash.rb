# p munich["mayors"]["prev"] # => "Ude"
  # Hash     # Hash   String
# CRUD with HASHES

# READ

# munich["country"] # => Germany
# munich["monument"] # => "Allianz Arena"
# munich["state"] # => nil

# CREATE

# munich["mayor"] = "Reiter"

# UPDATE
# munich["population"] += 1
# munich["population"] = 20000000

# DELETE
# munich.delete("mayor")

munich = {
  :country => "Germany",
  # Key           Value
  :monument => "Allianz Arena",
  :population => 1500000,
  # "mayors" => {
  #   "prev" => "Ude",
  #   "current" => "Reiter"
  # },
  # "clubs" => ["Sechzig", "Bayern"]
}
munich = {
  country: "Germany",
  # Key           Value
  monument: "Allianz Arena",
  population:  1500000,
  # "mayors" => {
  #   "prev" => "Ude",
  #   "current" => "Reiter"
  # },
  # "clubs" => ["Sechzig", "Bayern"]
}

# p munich[:country]
# p munich[:monument]
# p munich["country"] # =>nil

# EACH WITH HASHES
# munich.each do |key,value|
#   puts "Munich's #{key} is #{value}"
# end

munich.key?("country") # => true
munich.key?("state") # => false

munich.keys # => ["country", "monument", "population"]
# p munich.values[-1][1] # => "Bayern"

# Hash as a last method argument


def tag(name, attributes = {}, content )
  attributes_strings = attributes.map { |key, value| "#{key}='#{value}'"}
  formatted_attributes = attributes_strings.join(" ")

  # With each
  # attributes_array = []
  # attributes.each do |key,value|
  #   attributes_array << "#{key}='#{value}'"
  # end

  return "<#{name} #{formatted_attributes}>#{content}</#{name}>"
end

# p tag("h1", "Hello world")
# p tag("h1")
# <h1>Hello world</h1>

p tag("a", "Le Wagon", href: "http://lewagon.org", class: "btn", id: "logo" )
# <a href='http://lewagon.org' class='btn'>Le Wagon</a>