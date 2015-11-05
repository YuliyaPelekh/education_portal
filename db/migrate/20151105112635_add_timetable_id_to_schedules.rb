class AddTimetableIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :timetable_id, :integer
  end
end
