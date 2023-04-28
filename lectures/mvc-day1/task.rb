class Task
  # STATE:

  # - name/description
  # - done
  # - priority
  # - category
  # - due date
  
  # BEHAVIOUR
  # - mark as done!
  # - done?

  attr_reader :description
  
  def initialize(description)
    @description = description
    @done = false
  end
  
  def mark_as_done!
    @done = true
  end
  
  def done?
    @done
  end
end
