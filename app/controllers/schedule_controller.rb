class ScheduleController < ApplicationController
  
  def list
    @schedules = Schedule.find(:all, :order => 'date desc')
  end
  
  def view
    @schedule = Schedule.find_by_id(params[:id]) || Schedule.find(:first, :order => 'date desc')
    redirect_to create_schedule_url and return if @schedule.nil?
    @case = Case.find_by_id(params[:edit_id].to_i)
    if @case.nil?
      @case = Case.new
      @case.schedule_id = @schedule.id
      @case.start_time = @schedule.date
      @case.definite_start_time = true
    end
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
  
  def toggle_auto_reload
    if session[:skip_auto_reload].blank?
      session[:skip_auto_reload] = 'yes'
    else
      session[:skip_auto_reload] = nil
    end
    redirect_to request.env["HTTP_REFERER"]
  end
  
end
