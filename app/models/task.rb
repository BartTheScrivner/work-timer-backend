class Task < ApplicationRecord
  belongs_to :project
  has_many :task_tags
  has_many :tags, through: :task_tags
  has_many :task_sessions

  def total_time
    self.task_sessions.reduce{ |memo, session| memo += session.duration }
  end

  def remaining
    self.total_time - self.benchmark
  end

  def overtime
    self.total_time > self.benchmark
  end

  def number_of_sessions
    self.task_sessions.count
  end
end
