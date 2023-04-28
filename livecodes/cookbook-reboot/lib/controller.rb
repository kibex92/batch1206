require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end
  
  def list
    display_recipes
  end
  
  def add
    # 1. Get name + description from the user -> View
    name = @view.ask_user_for("name")
    desc = @view.ask_user_for("description")
    # 2. Create a new recipe object
    recipe = Recipe.new(name, desc)
    # 3. Send the recipe to the cookbook in order to save it
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

  private

  def display_recipes
    # 1. Get all recipes from the coobook
    recipes = @cookbook.all # -> Array of Recipe instances
    # 2. Pass the recipes to the view to display them
    @view.display(recipes)
  end
  
end