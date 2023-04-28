require_relative 'task'
require_relative 'view'
require_relative 'task_repository'
require_relative 'controller'
require_relative 'router'

task_repository = TaskRepository.new

# tasks = task_repository.all
# tasks -> Array of TASK INSTANCES!!!!!!


controller = Controller.new(task_repository)
router = Router.new(controller)
router.run