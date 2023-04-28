class TaskRepository
  # STATE
  # tasks

  def initialize
    @tasks = []
  end
  
  def create(task)
    # task is an INSTANCE OF TASK!
    @tasks << task
  end
  
  def destroy(index)
    @tasks.delete_at(index)
  end
  
  def all
    @tasks
  end
  
  def find(index)
    @tasks[index]
  end
end
