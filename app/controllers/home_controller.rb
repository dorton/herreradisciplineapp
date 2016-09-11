class HomeController < ApplicationController
  def index
  	 @students = Student.all
  	 @student_search = Student.search(params[:search])
  end
end
