class ScheduleController < ApplicationController
  
  def list
    @schedules = Schedule.find(:all, :order => 'date desc')
  end
  
  def view
    @schedule = Schedule.find_by_id(params[:id]) || Schedule.find(:first, :order => 'date desc')
    redirect_to create_schedule_url if @schedule.nil?
  end
  
  def create_schedule
    if request.post?
      date = Date.civil(params[:date][:"start(1i)"].to_i, params[:date][:"start(2i)"].to_i, params[:date][:"start(3i)"].to_i)
      @schedule = Schedule.create!(:date => date)
      redirect_to view_schedule_url(@schedule.id)
    end
  end
  
  def delete_schedule
    schedule = Schedule.find_by_id(params[:id].to_i) rescue nil
    schedule.destroy if !schedule.nil?
    redirect_to list_schedules_url
  end
  
end
