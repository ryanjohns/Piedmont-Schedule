class CaseController < ApplicationController
  
  def edit_case
    schedule = Schedule.find_by_id(params[:case]['schedule_id'].to_i)
    redirect_to list_schedules_url and return if !request.post? or schedule.nil?
    c = Case.find_by_id_and_schedule_id(params[:case]['id'].to_i, schedule.id) || Case.new
    c.attributes = params[:case]
    c.definite_start_time = false if params[:case]['definite_start_time'].blank?
    c.isolate = false if params[:case]['isolate'].blank?
    c.latex_allergy = false if params[:case]['latex_allergy'].blank?
    c.save and redirect_to view_schedule_url(schedule.id)
  end
  
  def delete_case
    redirect_to list_schedules_url and return if params[:id].blank?
    c = Case.find_by_id(params[:id].to_i)
    c.destroy and redirect_to view_schedule_url(c.schedule_id)
  end
  
end
