class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :tags, through: :tasks

  def total_time
    self.tasks.reduce { |memo, task| memo += task.total_time}
  end

  def sessions_completed
    self.tasks.reduce { |memo, task| memo += task.number_of_sessions}
  end
  
end
