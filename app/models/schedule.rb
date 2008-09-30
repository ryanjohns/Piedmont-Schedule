class Schedule < ActiveRecord::Base
  has_many :cases, :dependent => :destroy
  
  def date_str
    date.strftime("%B %d, %Y")
  end
end
