class Lunchdetention < ActiveRecord::Base
  belongs_to :student
  attr_accessible :administrator, :days, :end_date, :incident_date, :reason, :start_date
end
