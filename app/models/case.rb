class Case < ActiveRecord::Base
  
  STATUSES = [
                ["In AM",0],
                ["In OR",1],
                ["Sent For",2],
                ["Closing",3]
             ]
  
  ROOM_NUMBERS = [
                    ["Select...",""],
                    ["2","2"],
                    ["3","3"],
                    ["4","4"],
                    ["5","5"],
                    ["6","6"],
                    ["7","7"],
                    ["8","8"],
                    ["9","9"],
                    ["10","10"],
                    ["11","11"],
                    ["12","12"],
                    ["14","14"],
                    ["15","15"],
                    ["16","16"],
                    ["17","17"],
                    ["18","18"]
                 ]
  
  belongs_to :schedule
  
  validates_presence_of :room_number, :patient_name, :procedure, :surgeon, :nurse, :technician
  
  def start_time_str
    start_time.strftime("%H:%M")
  end
end
