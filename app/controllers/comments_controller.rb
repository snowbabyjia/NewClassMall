class CommentsController < ApplicationController
  before_filter :authenticate_user!
  # GET /comments
  # GET /comments.json
  def create
    @course = Course.find(params[:course_id])
    @comment = @course.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to course_path(@course)
    else
      flash[:notice] = 'Error creating comment: #(@comment.errors)'
      redirect_to(@course)
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    # if @comment.user == current_user 
    @comment.destroy
    #end
    redirect_to(@comment.course)
  end
end
