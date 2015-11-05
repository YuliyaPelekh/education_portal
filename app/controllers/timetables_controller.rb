class TimetablesController < ApplicationController
  def index
  	@timetables = Timetable.all
  end 

private

    def timetable_params
      params.require(:timetable).permit(:day, schedule_attributes: [ :hours, :group, :lesson, :timetable_id])
    end
end
