class SuspensionsController < ApplicationController
  # GET /suspensions
  # GET /suspensions.json
  def index
    @student = Student.find(params[:student_id])
    @student_suspensions = @student.suspensions.all
    @suspensions = Suspension.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @suspensions }
    end
  end

  # GET /suspensions/1
  # GET /suspensions/1.json
  def show
    @student = Student.find(params[:student_id])
    @suspension = @student.suspensions.find(params[:id])
    render :layout => "print"
    
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @suspension }
    # end
  end

  # GET /suspensions/new
  # GET /suspensions/new.json
  def new
    @student = Student.find(params[:student_id])
    @suspension = @student.suspensions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @suspension }
    end
  end

  # GET /suspensions/1/edit
  def edit
    @student = Student.find(params[:student_id])
    @suspension = @student.suspensions.find(params[:id])
  end

  # POST /suspensions
  # POST /suspensions.json
  def create
    @student = Student.find(params[:student_id])
    @suspension = @student.suspensions.create(params[:suspension])

    respond_to do |format|
      if @suspension.save
        StudentMailer.mailer_suspension(@student, @suspension).deliver
        format.html { redirect_to :back, notice: 'Suspension was successfully created and email was sent to teacher.' }
        format.json { render json: @suspension, status: :created, location: @suspension }
      else
        format.html { render action: "new" }
        format.json { render json: @suspension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /suspensions/1
  # PUT /suspensions/1.json
  def update
    @student = Student.find(params[:student_id])
    @suspension = @student.suspensions.find(params[:id])

    respond_to do |format|
      if @suspension.update_attributes(params[:suspension])
        format.html { redirect_to :back, notice: 'Suspension was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @suspension.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suspensions/1
  # DELETE /suspensions/1.json
  def destroy
    @student = Student.find(params[:student_id])
    @suspension = @student.suspensions.find(params[:id])
    @suspension.destroy

    respond_to do |format|
      format.html { redirect_to student_url(@student) }
      format.json { head :no_content }
    end
  end

  def all
    @students = Student.all(:order => "last_name DESC")
    @suspensions = Suspension.all(:order => "start_date DESC")
    @suspensions_count = Suspension.uniq.pluck(:student_id).count
    @suspensions_group = @suspensions.group_by {|t| t.student.full_name }
    

  end

end
