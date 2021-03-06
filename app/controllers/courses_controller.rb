class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
#  def index
#    @courses = Course.all

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @courses }
#    end
#  end

  
  def index
    @search = Course.search do
      fulltext params[:search]
    end
    @courses = @search.results
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
  
    
  def delete_course
    @professor = Professor.find(params[:professor_id])
    @course = Course.find(params[:id])
    @professor.courses.delete @course
    redirect_to course_path(@course)
  end
  
  def delete_major
    @major = Major.find(params[:major])
    @course = Course.find(params[:id])
    @major.courses.delete @course
    redirect_to course_path(@course)
  end

  def delete_distribution
    @distribution = Distribution.find(params[:distribution])
    @course = Course.find(params[:id])
    @distribution.courses.delete @course
    redirect_to course_path(@course)
  end
  
  def rate
    @course = Course.find(params[:id])
    @course.rate(params[:stars], current_user, params[:dimension])
    render text: (view_context.ratings_for @course), content_type: "text/html"
  end

end
