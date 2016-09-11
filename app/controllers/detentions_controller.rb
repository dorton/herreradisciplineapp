class DetentionsController < ApplicationController
  # GET /detentions
  # GET /detentions.json
  def index
    @student = Student.find(params[:student_id])
    @detention = @student.detentions.all
    @detentions = Detention.all(:include => :student)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @detentions }
    end
  end

  # GET /detentions/1
  # GET /detentions/1.json
  def show
    @student = Student.find(params[:student_id])
    @detention = @student.detentions.find(params[:id])
    render :layout => "print"

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @detention }
    # end
  end

  # GET /detentions/new
  # GET /detentions/new.json
  def new
    @student = Student.find(params[:student_id])
    @detention = @student.detentions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @detention }
    end
  end

  # GET /detentions/1/edit
  def edit
    @student = Student.find(params[:student_id])
    @detention = @student.detentions.find(params[:id])
  end

  # POST /detentions
  # POST /detentions.json
  def create
    @student = Student.find(params[:student_id])
    @detention = @student.detentions.create(params[:detention])

    respond_to do |format|
      if @detention.save
        format.html { redirect_to student_detention_path(@student, @detention), notice: 'Detention was successfully created.' }
        format.json { render json: @detention, status: :created, location: @detention }
      else
        format.html { render action: "new" }
        format.json { render json: @detention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /detentions/1
  # PUT /detentions/1.json
  def update
    @student = Student.find(params[:student_id])
    @detention = @student.detentions.find(params[:id])

    respond_to do |format|
      if @detention.update_attributes(params[:detention])
        format.html { redirect_to :back, notice: 'Detention was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @detention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detentions/1
  # DELETE /detentions/1.json
  def destroy
    @student = Student.find(params[:student_id])
    @detention = Detention.find(params[:id])
    @detention.destroy

    respond_to do |format|
      format.html { redirect_to student_url(@student) }
      format.json { head :no_content }
    end
  end

  def detentions_print
   
    render :layout => "detention_print"
  end

def all
   @students = Student.all
   @detentions = Detention.all(:order => "detention_date DESC")
   @detentions_date = @detentions.group_by {|t| t.detention_date }
   @detentions_count = Detention.uniq.pluck(:student_id).count



end

  def detention_mailer
    @student = Student.find(params[:student_id])
    @detention = Detention.find(params[:detention_id])
    StudentMailer.mailer_detention(@student, @detention).deliver
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Detention was emailed to teacher.' }
    end
  end


end
