class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @students = Student.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
    @detention = @student.detentions.new
    @detentions = @student.detentions.all(:order => "detention_date DESC")
    @inschool = @student.inschools.new
    @inschools = @student.inschools.all(:order => "start_date DESC")
    @suspension = @student.suspensions.new
    @suspensions = @student.suspensions.all(:order => "start_date DESC")
    @gradelevel = @student.gradelevels.new
    @gradelevels = @student.gradelevels.all(:order => "gldate DESC")
    @lunchdetention = @student.lunchdetentions.new
    @lunchdetentions = @student.lunchdetentions.all(:order => "start_date DESC")


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end

  end

  # GET /students/new
  # GET /students/new.json
  def new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  def import
    Student.import(params[:file])
    redirect_to :back, notice: "Students Imported"
  end

  def search
    @student = Student.where(params[:search])
  end



end
