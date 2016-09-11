class GradelevelsController < ApplicationController
  # GET /gradelevels
  # GET /gradelevels.json
  def index
    @student = Student.find(params[:student_id])
    @gradelevel = @student.gradelevels.all
    @gradelevels = Gradelevel.all(:include => :student)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gradelevels }
    end
  end

  # GET /gradelevels/1
  # GET /gradelevels/1.json
  def show
    @student = Student.find(params[:student_id])
    @gradelevel = @student.gradelevels.find(params[:id])
    render :layout => "print"


    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @gradelevel }
    # end
  end

  # GET /gradelevels/new
  # GET /gradelevels/new.json
def new
    @student = Student.find(params[:student_id])
    @gradelevel = @student.gradelevels.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gradelevel }
    end
  end

  # GET /gradelevels/1/edit
 def edit
    @student = Student.find(params[:student_id])
    @gradelevel = @student.gradelevels.find(params[:id])
  end

  # POST /gradelevels
  # POST /gradelevels.json
  def create
    @student = Student.find(params[:student_id])
    @gradelevel = @student.gradelevels.create(params[:gradelevel])

    respond_to do |format|
      if @gradelevel.save
        format.html { redirect_to student_gradelevel_path(@student, @gradelevel), notice: 'Grade Level Detention was successfully created.' }
        format.json { render json: @gradelevel, status: :created, location: @gradelevel }
      else
        format.html { render action: "new" }
        format.json { render json: @gradelevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gradelevels/1
  # PUT /gradelevels/1.json
  def update
    @student = Student.find(params[:student_id])
    @gradelevel = @student.gradelevels.find(params[:id])

    respond_to do |format|
      if @gradelevel.update_attributes(params[:gradelevel])
        format.html { redirect_to :back, notice: 'Grade Level Detention was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gradelevel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gradelevels/1
  # DELETE /gradelevels/1.json
  def destroy
    @student = Student.find(params[:student_id])
    @gradelevel = Gradelevel.find(params[:id])
    @gradelevel.destroy

    respond_to do |format|
      format.html { redirect_to student_url(@student) }
      format.json { head :no_content }
    end
  end

  def gradelevels_print
   
    render :layout => "gradelevel_print"
  end
end
