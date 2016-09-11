class WeeklyProcessor 
  
  def self.send_weekly_notices
        StudentMailer.mailer_detention(@student, @detention).deliver
      end

 
end
