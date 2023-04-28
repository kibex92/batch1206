require_relative 'view'
require_relative 'task'

class Controller
  # STATE
  # Repository
  def initialize(task_repository)
    @task_repository = task_repository
    @view = View.new
  end
  
  # BEHAVIOUR

  def list
    # 1. Get all the tasks -> From the repository .all method
    tasks = @task_repository.all
    # 2. Display tasks -> Call the view method
    @view.display(tasks)
  end
  
  def mark_as_done
    list
    # 3. Ask the user which task to mark as done -> view
    index = @view.ask_user_for_index
    # 4. Pass index to repository to find the task -> repository
    task = @task_repository.find(index)
    # 5. Mark task as done
    task.mark_as_done!
    list
  end  

  def add
    # 1- Get input from the user for the task -> view
    description = @view.ask_user_for_description
    # 2. Create a new task instance
    task = Task.new(description)
    # 3. Store the task in the repository -> repository
    @task_repository.create(task)
    # 4. List all tasks
    list
  end
end
