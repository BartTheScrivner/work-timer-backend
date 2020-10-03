class TaskSession < ApplicationRecord
  belongs_to :task

  def duration
    self.start - self.end
  end
  
end
