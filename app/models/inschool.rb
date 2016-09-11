class Inschool < ActiveRecord::Base
  belongs_to :student
  attr_accessible :administrator, :days, :end_date, :incident_date, :reason, :start_date, :previous_actions, :notes

  validates_presence_of :start_date, :end_date, :incident_date
end
