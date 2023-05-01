require 'open-uri'
require 'nokogiri'

require_relative 'view'
require_relative 'recipe'

class Controller
  URL = "https://www.allrecipes.com/search?q="

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end
  
  def list
    display_recipes
  end
  
  def add
    # Get user information -> name, description
    name = @view.ask_user_for("name")
    description = @view.ask_user_for("description")
    rating = @view.ask_user_for("rating")
    prep = @view.ask_user_for("Prep time?")
    # Create recipe instance
    recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep)
    # Send recipe to cookbook
    @cookbook.create(recipe)
  end
  
  def remove
    # 1. List all the recipes
    display_recipes
    # 2.Ask user which recipe to remove
    index = @view.ask_user_for_index
    # 3. Call .destroy in cookbook
    @cookbook.destroy(index)
  end

  def mark_as_done
    list
    # ask the user for index
    index = @view.ask_user_for_index
    @cookbook.mark_recipe_as_done(index)
    list
  end

  def import
    # 1. Ask user for ingredient -> view
    ingredient = @view.ask_user_for("ingredient")
    # 2. Build the URL to download
    search_url = "#{URL}#{ingredient}"
    # 3. Download the URL
    html = URI.open(search_url).read
    # 4. Parse it with Nokogiri
    doc = Nokogiri::HTML.parse(html)
    # 5. Start to scrape
    recipes = doc.search(".mntl-card-list-items").map do |element| # -> Search for every card on page that responds to our search
      unless element.search(".mntl-recipe-star-rating").empty? # -> Only searching for cards that have a recipe rating CSS Class
        recipe_url =  element.attribute("href").value # -> Storing the Recipe URL to further scrape there
        recipe_html = URI.open(recipe_url).read
        recipe_doc = Nokogiri::HTML.parse(recipe_html)
        name = recipe_doc.search("h1").text.strip
        description = recipe_doc.search(".article-subheading").text.strip
        rating = recipe_doc.search(".mntl-recipe-review-bar__rating").text.strip
        # The style code for the Prep/Total time is shared by several different elements
        # First we have to make sure that the css class contains the word Total Time, if not
        # we return a default string for it
        # if yes we look for the CSS Class holding the value of it, AT THE SAME LEVEL as the element we first select
        # That's why we use the ~, to stay on the same level in the HTML Code
        if recipe_doc.search(".mntl-recipe-details__label:contains('Total Time:')").empty?
          prep = "no time given"
        else
          prep = recipe_doc.search(".mntl-recipe-details__label:contains('Total Time:') ~ .mntl-recipe-details__value").text.strip 
        end
      end
      Recipe.new(name: name, description: description, rating: rating, prep_time: prep )
      # Return array of Recipe objects
    end.take(5)
    

      # scrape name and description
      # Create recipe objects -> Our Model
      # Store in an Array

    # 6. Display recipes to user -> View
    @view.display_list(recipes)
    # 7. Ask the user which recipe to store in the cookbook -> Index
    index = @view.ask_user_for_index
    # 8. Find the recipe with that index -> repository
    recipe = recipes[index]
    # 9. Create the recipe in the DB -> repository
    @cookbook.create(recipe)
  end

  private

  def display_recipes
    # 1. Get all recipes from the coobook
    recipes = @cookbook.all # -> Array of Recipe instances
    # 2. Pass the recipes to the view to display them
    @view.display_list(recipes)
  end
  
end