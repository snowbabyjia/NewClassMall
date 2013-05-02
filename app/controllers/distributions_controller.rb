class DistributionsController < ApplicationController
  # GET /distributions
  # GET /distributions.json
  def index
    @distributions = Distribution.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @distributions }
    end
  end

  # GET /distributions/1
  # GET /distributions/1.json
  def show
    @distribution = Distribution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @distribution }
    end
  end

  # GET /distributions/new
  # GET /distributions/new.json
  def new
    @distribution = Distribution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @distribution }
    end
  end

  # GET /distributions/1/edit
  def edit
    @distribution = Distribution.find(params[:id])
  end

  # POST /distributions
  # POST /distributions.json
  def create
    if params[:course_id].blank?
      @distribution = Distribution.new(params[:distribution])
  
      respond_to do |format|
        if @distribution.save
          format.html { redirect_to @distribution, notice: 'Distribution was successfully created.' }
          format.json { render json: @distribution, status: :created, location: @distribution }
        else
          format.html { render action: "new" }
          format.json { render json: @distribution.errors, status: :unprocessable_entity }
        end
      end
    else
      @distribution = Distribution.find(params[:distribution][:id])
      @course = Course.find(params[:course_id])
      if !@course.distributions.include?(@distribution)
        @course.distributions << @distribution
        redirect_to course_path(@course), notice: "Added distribution to this course!"
      else
        redirect_to course_path(@course), notice: "This course already has this distribution!"
      end
    end
  end

  # PUT /distributions/1
  # PUT /distributions/1.json
  def update
    @distribution = Distribution.find(params[:id])

    respond_to do |format|
      if @distribution.update_attributes(params[:distribution])
        format.html { redirect_to @distribution, notice: 'Distribution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @distribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distributions/1
  # DELETE /distributions/1.json
  def destroy
    @distribution = Distribution.find(params[:id])
    @distribution.destroy

    respond_to do |format|
      format.html { redirect_to distributions_url }
      format.json { head :no_content }
    end
  end
  
  def delete_course
    @distribution = Distribution.find(params[:id])
    @course = Course.find(params[course])
    @distribution.courses.delete @course
    redirect_to @distribution, :notice => "Deleted course from this distribution!"
  end
end
