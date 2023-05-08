require "json"
require "rest-client"

response = RestClient.get "https://api.github.com/users/lewagon/repos"
repos = JSON.parse(response)
# => repos is an `Array` of `Hashes`.
p repos.first["name"] # -> Hash

# Restaurant.create(name: )
repos.size