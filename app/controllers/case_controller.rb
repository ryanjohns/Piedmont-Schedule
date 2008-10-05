class CaseController < ApplicationController
  
  def edit_case
    schedule = Schedule.find_by_id(params[:case]['schedule_id'].to_i)
    redirect_to list_schedules_url and return if !request.post? or schedule.nil?
    c = Case.find_by_id_and_schedule_id(params[:case]['id'].to_i, schedule.id) || Case.new
    c.attributes = params[:case]
    c.save and redirect_to view_schedule_url(schedule.id)
  end
  
  def delete_case
    redirect_to list_schedules_url and return if params[:case_id].blank?
    c = Case.find_by_id(params[:case_id].to_i)
    c.destroy and redirect_to view_schedule_url(c.schedule_id)
  end
  
end
