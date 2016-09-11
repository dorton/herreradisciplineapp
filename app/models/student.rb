class Student < ActiveRecord::Base
  attr_accessible :first_name, :grade, :last_name, :parent_name, :stu_id, :teacher, :phone, :teacheremail
  has_many :detentions
  has_many :inschools
  has_many :suspensions
  has_many :gradelevels
  has_many :lunchdetentions

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		student = find_by_stu_id(row["stu_id"]) || new
  		student.attributes = row.to_hash.slice(*accessible_attributes)
  		student.save!
  	end
  end

  def self.search(search)
    if search
      where 'last_name LIKE ?', "%#{search}%"
    else
      scoped
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

def avatar_url
  file_name = "#{stu_id}.jpg"
  
  if Rails.application.assets.find_asset file_name
    file_name
  else
    "blank.jpeg"
  end
end

end
