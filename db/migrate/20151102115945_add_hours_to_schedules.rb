class AddHoursToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :hours, :time
  end
end
