class View
  def ask_user_for(stuff)
    puts "What's the #{stuff} of your recipe?"
    gets.chomp
  end
  
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} - #{recipe.description}"
    end
  end

  def ask_user_for_index
    puts "What's the number of the recipe?"
    gets.chomp.to_i - 1
  end
end
