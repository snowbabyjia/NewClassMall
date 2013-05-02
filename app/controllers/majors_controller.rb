class MajorsController < ApplicationController
  # GET /majors
  # GET /majors.json
  def index
    @majors = Major.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @majors }
    end
  end

  # GET /majors/1
  # GET /majors/1.json
  def show
    @major = Major.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @major }
    end
  end

  # GET /majors/new
  # GET /majors/new.json
  def new
    @major = Major.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @major }
    end
  end

  # GET /majors/1/edit
  def edit
    @major = Major.find(params[:id])
  end

  # POST /majors
  # POST /majors.json
  def create
    if !params[:user_id].blank?
      @major = Major.find(params[:major][:id])
      unless current_user.majors.include?(@major)
        unless current_user.has_role? :admin
          current_user.majors << @major
        end
        redirect_to user_path(current_user), notice: 'Added major to your profile!'
      else
        redirect_to user_path(current_user), notice: 'You already have this major!'
      end
    elsif !params[:course_id].blank?
      @major = Major.find(params[:major][:id])
      @course = Course.find(params[:course_id])
      unless @major.courses.include?(@course)
        @course.majors << @major
        redirect_to course_path(@course), notice: 'Added major to this course!'
      else
        redirect_to course_path(@course), notice: 'Course already has this major!'
      end
    else
      @major = Major.new(params[:major])

    respond_to do |format|
        if @major.save
          format.html { redirect_to @major, notice: 'Major was successfully created.' }
          format.json { render json: @major, status: :created, location: @major }
        else
          format.html { render action: "new" }
          format.json { render json: @major.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /majors/1
  # PUT /majors/1.json
  def update
    @major = Major.find(params[:id])

    respond_to do |format|
      if @major.update_attributes(params[:major])
        format.html { redirect_to @major, notice: 'Major was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @major.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /majors/1
  # DELETE /majors/1.json
  def destroy
    @major = Major.find(params[:id])
    @major.destroy

    respond_to do |format|
      format.html { redirect_to majors_url }
      format.json { head :no_content }
    end
  end
  
  def delete_course
    @major = Major.find(params[:id])
    @course = Course.find(params[course])
    @major.courses.delete @course
    redirect_to @major, :notice => "Deleted course from this major!"
  end
  
  def delete_user
    @major = Major.find(params[:id])
    @user = User.find(params[:user_id])
    @major.users.delete @user
    redirect_to @major, :notice => "Deleted user from this major!"
  end
end
