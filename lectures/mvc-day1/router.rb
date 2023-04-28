class Router
  # STATE
  # - controller
  def initialize(controller)
    @controller = controller
  end
  
  # behaviour
  # Print out the menu
  # Get the user action
  # Connect action to controller

  def run
    loop do
      print_menu
      puts "What do you want to do?"
      action = gets.chomp.to_i
      dispatch(action)
    end
  end
  
  def print_menu
    puts "Welcome to your TODO Manager"
    puts "1 - List all my tasks"
    puts "2 - Add a new task"
    puts "3 - Mark a task as done"
  end
  
  def dispatch(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.mark_as_done
    else
      puts "Wrong input"
    end
  end
  
end