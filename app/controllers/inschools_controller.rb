class InschoolsController < ApplicationController
  # GET /inschools
  # GET /inschools.json
  def index
    @student = Student.find(params[:student_id])
    @student_inschools = @student.inschools.all
    @inschools = Inschool.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inschools }
    end
  end

  # GET /inschools/1
  # GET /inschools/1.json
  def show
    @student = Student.find(params[:student_id])
    @inschool = @student.inschools.find(params[:id])
    render :layout => "print"
    
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @inschool }
    # end
  end

  # GET /inschools/new
  # GET /inschools/new.json
  def new
    @student = Student.find(params[:student_id])
    @inschool = @student.inschools.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inschool }
    end
  end

  # GET /inschools/1/edit
  def edit
    @student = Student.find(params[:student_id])
    @inschool = @student.inschools.find(params[:id])
  end

  # POST /inschools
  # POST /inschools.json
  def create
    @student = Student.find(params[:student_id])
    @inschool = @student.inschools.create(params[:inschool])

    respond_to do |format|
      if @inschool.save
        StudentMailer.mailer_inschool(@student, @inschool).deliver
        format.html { redirect_to :back, notice: 'Inschool was successfully created and an email sent was sent to the teacher.' }
        format.json { render json: @inschool, status: :created, location: @inschool }
      else
        format.html { render action: "new" }
        format.json { render json: @inschool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inschools/1
  # PUT /inschools/1.json
  def update
    @student = Student.find(params[:student_id])
    @inschool = @student.inschools.find(params[:id])

    respond_to do |format|
      if @inschool.update_attributes(params[:inschool])
        format.html { redirect_to :back, notice: 'Inschool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inschool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inschools/1
  # DELETE /inschools/1.json
  def destroy
    @student = Student.find(params[:student_id])
    @inschool = Inschool.find(params[:id])
    @inschool.destroy

    respond_to do |format|
      format.html { redirect_to student_url(@student) }
      format.json { head :no_content }
    end
  end

  def all

    @students = Student.all(:order => "last_name DESC")
    @inschools = Inschool.all(:order => "start_date DESC")
    @inschool_count = Inschool.uniq.pluck(:student_id).count
    @inschools_group = @inschools.group_by {|t| t.student.full_name }
  end
end
