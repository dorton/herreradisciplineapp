class Search < ActiveRecord::Base
  attr_accessible :keywords

  validates_presence_of :keywords

	def students
	  @students ||= find_students
	end

 def avatar_url
  file_name = "#{stu_id}.jpg"
  
  if Rails.application.assets.find_asset file_name
    file_name
  else
    "blank.jpeg"
  end
end

private

	def find_students
	  students = Student.order(:last_name)
	  students = students.where("first_name like ? OR last_name like ? OR teacher like ? OR first_name||' '||last_name like ?", "%#{keywords}%", "%#{keywords}%", "%#{keywords}%", "%#{keywords}%" ) if keywords.present?
	end



end
