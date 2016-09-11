class LunchdetentionsController < ApplicationController
  # GET /lunchdetentions
  # GET /lunchdetentions.json
 def index
    @student = Student.find(params[:student_id])
    @student_lunchdetentions = @student.lunchdetentions.all
    @lunchdetentions = Lunchdetention.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lunchdetentions }
    end
  end

  # GET /lunchdetentions/1
  # GET /lunchdetentions/1.json
  def show
    @student = Student.find(params[:student_id])
    @lunchdetention = @student.lunchdetentions.find(params[:id])
    render :layout => "print"
    
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @lunchdetention }
    # end
  end

  # GET /lunchdetentions/new
  # GET /lunchdetentions/new.json
  def new
    @student = Student.find(params[:student_id])
    @lunchdetention = @student.lunchdetentions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lunchdetention }
    end
  end

  # GET /lunchdetentions/1/edit
  def edit
    @student = Student.find(params[:student_id])
    @lunchdetention = @student.lunchdetentions.find(params[:id])
  end

  # POST /lunchdetentions
  # POST /lunchdetentions.json
  def create
    @student = Student.find(params[:student_id])
    @lunchdetention = @student.lunchdetentions.create(params[:lunchdetention])

    respond_to do |format|
      if @lunchdetention.save
        format.html { redirect_to student_lunchdetention_path(@student, @lunchdetention), notice: 'lunchdetention was successfully created.' }
        format.json { render json: @lunchdetention, status: :created, location: @lunchdetention }
      else
        format.html { render action: "new" }
        format.json { render json: @lunchdetention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lunchdetentions/1
  # PUT /lunchdetentions/1.json
  def update
    @student = Student.find(params[:student_id])
    @lunchdetention = @student.lunchdetentions.find(params[:id])

    respond_to do |format|
      if @lunchdetention.update_attributes(params[:lunchdetention])
        format.html { redirect_to :back, notice: 'lunchdetention was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lunchdetention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lunchdetentions/1
  # DELETE /lunchdetentions/1.json
  def destroy
    @student = Student.find(params[:student_id])
    @lunchdetention = Lunchdetention.find(params[:id])
    @lunchdetention.destroy

    respond_to do |format|
      format.html { redirect_to student_url(@student) }
      format.json { head :no_content }
    end
  end

  def all
    @students = Student.all(:order => "last_name DESC")
    @lunchdetentions = Lunchdetention.all(:order => "start_date DESC")
    @lunchdetention_count = Lunchdetention.uniq.pluck(:student_id).count
    @lunchdetentions_group = @lunchdetentions.group_by {|t| t.student.full_name }
  end
end