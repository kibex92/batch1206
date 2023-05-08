require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end
  
  def all
    @recipes
  end
  
  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  def mark_recipe_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # TODO: Accomodate for rating
      # row  => Is now a Hash-like Object, containing all the values to create a new Recipe
      row[:done] = row[:done] == "true"
      recipe = Recipe.new(row)
      @recipes << recipe
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["name", "description", "rating","prep_time", "done"]
      @recipes.each do |recipe|
        # TODO: Store rating
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done?]
      end
    end
  end
end

