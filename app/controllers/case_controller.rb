class CaseController < ApplicationController
  
  def edit_case
    redirect_to list_schedules_url and return if params[:schedule_id].blank?
    @schedule = Schedule.find_by_id(params[:schedule_id].to_i)
    redirect_to list_schedules_url and return if @schedule.nil?
    @case = Case.find_by_id_and_schedule_id(params[:case_id].to_i, @schedule.id) || Case.new
    @case.schedule_id = @schedule.id if @case.new_record?
    @case.start_time = @schedule.date if @case.new_record?
    if request.post?
      @case.attributes = params[:case]
      redirect_to view_schedule_url(@schedule.id) if @case.save
    end
  end
  
  def delete_case
    redirect_to list_schedules_url and return if params[:case_id].blank?
    c = Case.find_by_id(params[:case_id].to_i)
    c.destroy and redirect_to view_schedule_url(c.schedule_id)
  end
  
  def change_status
    redirect_to list_schedules_url and return if !request.post? or params['case_id'].blank?
    c = Case.find_by_id(params['case_id'].to_i)
    c.status = params['status']
    c.save! and redirect_to view_schedule_url(c.schedule_id)
  end
  
  def change_patient_location
    redirect_to list_schedules_url and return if !request.post? or params['case_id'].blank?
    c = Case.find_by_id(params['case_id'].to_i)
    c.patient_location = params['patient_location']
    c.save! and redirect_to view_schedule_url(c.schedule_id)
  end
  
end
