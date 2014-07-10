class Task < ActiveRecord::Base

  belongs_to :project
  has_many :logs, dependent: :destroy

  default_scope { order(:done, created_at: :desc) }

  validates_presence_of :name, :project

  # Task is considered "in work" if there is a task log without a stop time
  def in_work?
    !logs.empty? && !logs.first.stop?
  end

  def startable?
    !done? && !in_work?
  end

  def logged
    logs.map(&:duration).sum
  end

end
