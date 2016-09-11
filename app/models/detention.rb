class Detention < ActiveRecord::Base
  belongs_to :student
  attr_accessible :administrator, :detention_date, :incident_date, :reason, :student_id, :previous_actions, :notes

  validates_presence_of :detention_date, :incident_date

end
