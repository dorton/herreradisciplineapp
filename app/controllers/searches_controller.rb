class SearchesController < ApplicationController
  autocomplete :student, :first_name, :display_value => :full_name, :extra_data => [:first_name, :last_name]
  


  def index

  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(params[:search])
    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successful.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def show
    @search = Search.find(params[:id])
  end

  def detention_mailer
    @student = Student.find(params[:student_id])
    @detention = Detention.find(params[:detention_id])
    StudentMailer.detention(@student, @detention).deliver
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Detention was emailed to teacher.' }
    end
  end

end
