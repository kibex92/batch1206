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

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      recipe = Recipe.new(row[0], row[1])
      @recipes << recipe
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end

