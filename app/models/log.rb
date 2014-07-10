class Log < ActiveRecord::Base
  belongs_to :task

  default_scope { order(:stop) }

  validates_presence_of :task

  def duration
    ((stop? ? stop : Time.now) - start).to_i
  end
end
