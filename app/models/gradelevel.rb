class Gradelevel < ActiveRecord::Base
  belongs_to :student
  attr_accessible :gldate, :glincident_date, :glreason, :glteacher

  validates_presence_of :gldate, :glincident_date, :glreason
end
