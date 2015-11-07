class Schedule < ActiveRecord::Base
  belongs_to :timetable
  validates :hours, presence: true
  validates :group, presence: true
  validates :lesson, presence: true
  validates :timetable_id, presence: true
end
