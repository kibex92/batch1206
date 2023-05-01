require 'nokogiri'
require 'open-uri'

# 1. Define a URL
url = "https://www.allrecipes.com/search?q=banana"

html = URI.open(url).read # => String
doc = Nokogiri::HTML.parse(html)

doc.search(".mntl-card-list-items").first(5).each do |element| # -> Search for every card on page that responds to our search
  unless element.search(".mntl-recipe-star-rating").empty? # -> Only searching for cards that have a recipe rating CSS Class
    recipe_url =  element.attribute("href").value # -> Storing the Recipe URL to further scrape there
    # To get a searchable Nokogiri Object -> Repeat lines 7 + 8
    # With the scraped data -> Create recipe objects
  end
  # Return array of Recipe objects
end
