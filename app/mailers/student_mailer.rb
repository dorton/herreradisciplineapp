class StudentMailer < ActionMailer::Base

  def mailer_detention(student, detention)

    office_teachers = []
    Detention.where("detention_date > ? and detention_date <= ?", Time.now.beginning_of_week(:thursday).strftime("%Y-%m-%d"),Time.now.end_of_week(:thursday).strftime("%Y-%m-%d")).each do |offdetention|
     office_teachers << offdetention.student.teacheremail
    end

    grade_teachers = []
    Gradelevel.where("gldate > ? and gldate <= ?", Time.now.beginning_of_week(:thursday).strftime("%Y-%m-%d"),Time.now.end_of_week(:thursday).strftime("%Y-%m-%d")).each do |gldetention|
      grade_teachers << gldetention.student.teacheremail
    end


recipients = office_teachers + grade_teachers

sender = "Herrera Discipline <discipline@hattech.net>"
copied = [ "bdorton@houstonisd.org, MGUTIE16@houstonisd.org, MVIZI@houstonisd.org, SCASTIL2@houstonisd.org, ISOTO@houstonisd.org, CJACKS33@houstonisd.org, CPACHECO@houstonisd.org" ]

if recipients.empty?
  subject = "No Detentions Today!!!!!" 
else
  subject = "Detentions for #{Time.now.end_of_week(start_day = :thursday).strftime("%m/%d/%Y")}"
end

mail( to: recipients, from: sender, cc: copied, subject: subject)

end

  def mailer_inschool(student, inschool)
  	@student = student
  	@inschool = inschool
  	
    mail( to: student.teacheremail, from: "Herrera Discipline <discipline@hattech.net>", cc: "bdorton@houstonisd.org, MGUTIE16@houstonisd.org, MVIZI@houstonisd.org, SCASTIL2@houstonisd.org, ISOTO@houstonisd.org, EOROZCO2@houstonisd.org, CJACKS33@houstonisd.org, CPACHECO@houstonisd.org" , subject: "ISS - #{student.full_name}")
  end

  def mailer_suspension(student, suspension)
  	@student = student
  	@suspension = suspension
  	
    mail( to: student.teacheremail, from: "Herrera Discipline <discipline@hattech.net>", cc: "bdorton@houstonisd.org, MGUTIE16@houstonisd.org, MVIZI@houstonisd.org, SCASTIL2@houstonisd.org, ISOTO@houstonisd.org, CPACHECO@houstonisd.org" , subject: "Suspension - #{student.full_name}")
  end

end
