class View
  # Is only a worker class
  def display(tasks)
    tasks.each_with_index do |task, index|
      # task -> Task instance
      status = task.done? ? "[X]" : "[ ]"
      puts "#{index + 1} #{status} - #{task.description}"
    end
  end

  def ask_user_for_index
    puts "What is the number of the task you want to mark as done?"
    gets.chomp.to_i - 1
  end

  def ask_user_for_description
    puts "What is the task?"
    gets.chomp
  end
end

