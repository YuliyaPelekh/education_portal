class SchedulesController < ApplicationController
  
  def new
  	@schedule = Schedule.new(:timetable_id => params[:timetable_id])
  end

  def create
    @schedule = Schedule.new(schedule_params) 
    if @schedule.save
      flash[:success] = "Запис збережений"
      redirect_to timetables_path
    else
      flash.now[:error] = 'Запис не збережений'
      render '/schedules/new'
    end 
  end

  def edit
     @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
  if @schedule.update(schedule_params)
    redirect_to timetables_path
  else
    render '/schedules/edit'
  end
  end

  def destroy
    Schedule.find(params[:id]).destroy
    flash[:success] = "Запис видалено"
    redirect_to timetables_path
  end

  private

    def schedule_params
      params.require(:schedule).permit(:hours, :group, :lesson, :timetable_id)
    end


end
