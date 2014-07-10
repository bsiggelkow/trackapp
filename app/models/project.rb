class Project < ActiveRecord::Base

  has_many :tasks, dependent: :destroy
  has_many :logs, through: :tasks

  validates_presence_of :name

  # Sum all time (in seconds) logged for a task
  def logged
    logs.map(&:duration).sum
  end

end
