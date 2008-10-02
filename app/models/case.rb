class Case < ActiveRecord::Base
  
  STATUSES = [ "", "Sent For", "Pre-Op", "Running", "Closing" ]
  
  OR_NUMBERS = [ "", 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 15, 16, 17, 18, 19, 20, 21, 22 ]
  
  belongs_to :schedule
  
  validates_presence_of :patient_name, :procedure, :surgeon
  
  def start_time_str
    start_time.strftime("%H:%M")
  end
end
