class View
  def ask_user_for(stuff)
    puts "What's the #{stuff} of your recipe?"
    gets.chomp
  end
  
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      # TODO: Display also the rating
      status = recipe.done? ? "[X]" : "[ ]"
      print"#{index + 1}. #{status} #{recipe.name} - #{recipe.description}"
      print "(#{recipe.rating}/5)"
      puts  ", Prep: #{recipe.prep_time}"
    end
  end

  def ask_user_for_index
    puts "What's the number of the recipe?"
    gets.chomp.to_i - 1
  end
end
