class SchedulesController < ApplicationController
  
  def index
  	@schedules = Schedule.all.order('day, hours')
  end 

  def new
  	@schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params) 
    if @schedule.save
      @schedules = Schedule.all
      flash[:success] = "Запис збережений"
      redirect_to schedules_path
    else
      flash.now[:error] = 'Запис не збережений'
      render '/schedule/new'
    end 
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
 
  if @schedule.update(schedule_params)
    redirect_to schedules_path
  else
    render '/schedule/edit'
  end
  end

  def destroy
    Schedule.find(params[:id]).destroy
    flash[:success] = "Запис видалено"
    redirect_to schedules_path
  end

  private

    def schedule_params
      params.require(:schedule).permit(:day, :hours, :group, :lesson)
    end
end
